using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestDaw : MonoBehaviour {
    public bool draw2048;
    public bool draw64;
    public bool instancing;
    public int batchCount;

    public int drawCount { get { return batchCount * CountPerBatch; } }

    public const int CountPerBatch = 200;

    private Mesh _mesh;
    // _material64 与 _material1024 使用同一个 shader
    private Material _material64;
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

    public void SetNoTexture(bool val)
    {
        if (val)
        {
            _material1024.EnableKeyword("NoTexture");
            _material2048.EnableKeyword("NoTexture");
        }
        else
        {
            _material1024.DisableKeyword("NoTexture");
            _material2048.DisableKeyword("NoTexture");
        }
    }

    public void InitMatrixes(int order)
    {
        if(order == 0) // 正序
        {
            for (int i = 0, imax = _matrixies.Length; i < imax; i++)
                _matrixies[i] = Matrix4x4.TRS(new Vector3(i * 0.0001f, i * 0.0001f, i), Quaternion.identity, new Vector3(10f, 10f, 10f));
        }
        else
        {
            for (int i = 0, imax = _matrixies.Length; i < imax; i++)
                _matrixies[i] = Matrix4x4.TRS(new Vector3(i * 0.0001f, i * 0.0001f, (CountPerBatch - i)), Quaternion.identity, new Vector3(10f, 10f, 10f));
        }
    }

    void Start () {

        Application.targetFrameRate = 1000;
        batchCount = 1;

        CreateMesh();
        _material64 = Resources.Load<Material>("Mat64");
        _material1024 = Resources.Load<Material>("Mat1024");
        _material2048 = Resources.Load<Material>("Mat2048");
        _material2048.DisableKeyword("Enable_2048Nearby");
        _material2048.DisableKeyword("ForceLod3");
        _material1024.DisableKeyword("EnableClip");
        _material2048.DisableKeyword("EnableClip");
        _material1024.DisableKeyword("Only1Sampler");
        _material2048.DisableKeyword("Only1Sampler");
        _material1024.DisableKeyword("NoTexture");
        _material2048.DisableKeyword("NoTexture");


        _matrixies = new Matrix4x4[CountPerBatch];
        InitMatrixes(0);
	}

    void Update()
    {
        Material mat = _material1024;
        if (draw2048)
            mat = _material2048;
        else if (draw64)
            mat = _material64;

        for (int i = 0; i < batchCount; i++)
        {
            if (instancing)
            {
                mat.enableInstancing = true;
                Graphics.DrawMeshInstanced(_mesh, 0, mat, _matrixies);
            }
            else
            {
                mat.enableInstancing = false; ;
                for (int j = 0; j < CountPerBatch; j++)
                    Graphics.DrawMesh(_mesh, _matrixies[j], mat, 0);
            }
        }
            
    }

    private void CreateMesh()
    {
        _mesh = new Mesh();

        Vector3[] verts = new Vector3[11 * 11];
        for(int x = 0; x < 11; x++)
            for(int y = 0; y < 11; y++)
                verts[y * 11 + x] = new Vector3(x * 0.1f, y * 0.1f, 0);
        _mesh.vertices = verts;

        Vector2[] uvs = new Vector2[11 * 11];
        for (int x = 0; x < 11; x++)
            for (int y = 0; y < 11; y++)
                uvs[y * 11 + x] = new Vector3(x * 0.1f, y * 0.1f, 0);
        _mesh.uv = uvs;

        int[] indices = new int[600];

        // 当前格子使用到的 4 个顶点(从左下角沿N型排列)
        int[] vertIdxies = new int[4];
        for (int x = 0; x < 10; x++)
        {
            for(int y = 0; y < 10; y++)
            {
                vertIdxies[0] = y * 11 + x;
                vertIdxies[1] = (y + 1) * 11 + x;
                vertIdxies[2] = y * 11 + x + 1;
                vertIdxies[3] = (y + 1) * 11 + x + 1;

                int quadIdx = (y * 10 + x) * 6;
                indices[quadIdx + 0] = vertIdxies[0];
                indices[quadIdx + 1] = vertIdxies[1];
                indices[quadIdx + 2] = vertIdxies[2];
                indices[quadIdx + 3] = vertIdxies[3];
                indices[quadIdx + 4] = vertIdxies[2];
                indices[quadIdx + 5] = vertIdxies[1];
            }
        }

        _mesh.triangles = indices;
        _mesh.UploadMeshData(true);
    }
}
