using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestDaw : MonoBehaviour {
    public bool draw2048;
    public int batchCount;

    public int drawCount { get { return batchCount * CountPerBatch; } }

    public const int CountPerBatch = 200;

    private Mesh _mesh;
    private Material _material1024;
    private Material _material2048;
    private Matrix4x4[] _matrixies;

    public void Set2048Nearby(bool val)
    {
        if (val)
            _material2048.EnableKeyword("Enable_2048Nearby");
        else
            _material2048.DisableKeyword("Enable_2048Nearby");
    }

    public void SetForceLod3(bool val)
    {
        if (val)
            _material2048.EnableKeyword("ForceLod3");
        else
            _material2048.DisableKeyword("ForceLod3");
    }

    public void SetEnableClip(bool val)
    {
        if (val)
        {
            _material1024.EnableKeyword("EnableClip");
            _material2048.EnableKeyword("EnableClip");
        }
        else
        {
            _material1024.DisableKeyword("EnableClip");
            _material2048.DisableKeyword("EnableClip");
        }
    }

    public void SetOnly1Sampler(bool val)
    {
        if (val)
        {
            _material1024.EnableKeyword("Only1Sampler");
            _material2048.EnableKeyword("Only1Sampler");
        }
        else
        {
            _material1024.DisableKeyword("Only1Sampler");
            _material2048.DisableKeyword("Only1Sampler");
        }
    }

    void Start () {

        Application.targetFrameRate = 1000;
        batchCount = 1;

        CreateMesh();
        _material1024 = Resources.Load<Material>("Mat1024");
        _material2048 = Resources.Load<Material>("Mat2048");
        _material2048.DisableKeyword("Enable_2048Nearby");
        _material2048.DisableKeyword("ForceLod3");
        _material1024.DisableKeyword("EnableClip");
        _material2048.DisableKeyword("EnableClip");
        _material1024.DisableKeyword("Only1Sampler");
        _material2048.DisableKeyword("Only1Sampler");


        _matrixies = new Matrix4x4[CountPerBatch];
        for(int i = 0, imax = _matrixies.Length; i < imax; i++)
        {
            _matrixies[i] = Matrix4x4.TRS(new Vector3(i * 0.1f, i * 0.1f, (CountPerBatch - i)), Quaternion.identity, new Vector3(10f, 10f, 10f));
            //_matrixies[i] = Matrix4x4.TRS(new Vector3(i * 0.1f, i * 0.1f, i), Quaternion.identity, new Vector3(10f, 10f, 10f));
        }
	}

    void Update()
    {
        for(int i = 0; i < batchCount; i++)
            Graphics.DrawMeshInstanced(_mesh, 0, draw2048 ? _material2048 : _material1024, _matrixies);
    }

    private void CreateMesh()
    {
        _mesh = new Mesh();
        Vector3[] verts = new Vector3[4];
        verts[0] = new Vector3(0, 0, 0);
        verts[1] = new Vector3(0, 1, 0);
        verts[2] = new Vector3(1, 0, 0);
        verts[3] = new Vector3(1, 1, 0);
        _mesh.vertices = verts;

        Vector2[] uvs = new Vector2[4];
        uvs[0] = new Vector2(0, 0);
        uvs[1] = new Vector2(0, 1);
        uvs[2] = new Vector2(1, 0);
        uvs[3] = new Vector2(1, 1);
        _mesh.uv = uvs;

        int[] indices = new int[6] { 0, 1, 2, 3, 2, 1 };
        _mesh.triangles = indices;
        _mesh.UploadMeshData(true);
    }
}
