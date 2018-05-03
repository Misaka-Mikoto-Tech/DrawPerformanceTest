using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

public class CombineObjFileWindow : EditorWindow
{
    [MenuItem("Tools/CombineObjFile")]
    public static void OpenWindow()
    {
        CombineObjFileWindow win = GetWindow<CombineObjFileWindow>();
        win.titleContent = new GUIContent("合并Obj文件");
        win.Show();
    }

    public Object vertFile;
    public Object normalFile;
    public Object uvFile;
    public string newFileName;

    private Mesh            _mesh;
    private List<Vector3>   _verts;
    private List<Vector3>   _normals;
    private List<Vector2>   _uvs;
    private List<int>       _indicies;

    private void OnGUI()
    {
        EditorGUILayout.BeginVertical();
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("顶点文件", GUILayout.Width(60));
        vertFile = EditorGUILayout.ObjectField(vertFile, typeof(Object), false);
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("法线文件", GUILayout.Width(60));
        normalFile = EditorGUILayout.ObjectField(normalFile, typeof(Object), false);
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("UV文件", GUILayout.Width(60));
        uvFile = EditorGUILayout.ObjectField(uvFile, typeof(Object), false);
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("新文件名", GUILayout.Width(60));
        newFileName = EditorGUILayout.TextField(newFileName);
        EditorGUILayout.EndHorizontal();

        DrawSpace(4);

        EditorGUILayout.BeginHorizontal();
        DrawSpace(4);
        if (GUILayout.Button("合并文件"))
        {
            string vertPath = AssetDatabase.GetAssetPath(vertFile);
            string normalPath = AssetDatabase.GetAssetPath(normalFile);
            string uvPath = AssetDatabase.GetAssetPath(uvFile);

            #region CheckValid
            if (string.IsNullOrEmpty(vertPath))
            {
                Debug.LogError("请设置顶点文件");
                return;
            }
            if (string.IsNullOrEmpty(normalPath))
            {
                Debug.LogError("请设置法线文件");
                return;
            }
            if (string.IsNullOrEmpty(uvPath))
            {
                Debug.LogError("请设置UV文件");
                return;
            }

            if (string.IsNullOrEmpty(newFileName))
            {
                Debug.LogError("请设置新文件名");
                return;
            }
            #endregion

            string newFilePath = string.Format("{0}/{1}.asset", vertPath.Substring(0, vertPath.LastIndexOf("/")), newFileName);
            CombineObjFile(vertPath, normalPath, uvPath, newFilePath);
        }
        DrawSpace(4);
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.EndVertical();
    }

    private void CombineObjFile(string vertPath, string normalPath, string uvPath, string newFilePath)
    {
        _mesh = new Mesh();
        _verts = new List<Vector3>(3000);
        _normals = new List<Vector3>(3000);
        _uvs = new List<Vector2>(3000);
        _indicies = new List<int>(9000);

        ForeachLine(File.OpenText(vertPath), VertFileLineProcess);
        ForeachLine(File.OpenText(normalPath), NormalFileLineProcess);
        ForeachLine(File.OpenText(uvPath), UvFileLineProcess);

        if(_verts.Count != _normals.Count || _verts.Count != _uvs.Count)
        {
            Debug.LogError("Error in Parsing Obj files");
            return;
        }

        _mesh.SetVertices(_verts);
        _mesh.normals = _normals.ToArray();
        _mesh.uv = _uvs.ToArray();
        _mesh.triangles = _indicies.ToArray();

        AssetDatabase.DeleteAsset(newFilePath);
        AssetDatabase.CreateAsset(_mesh, newFilePath);
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        Debug.LogFormat("<color=green>资源生成成功 {0}</color>", newFilePath);
    }

    private void ForeachLine(StreamReader sr, System.Action<string[]> callback)
    {
        string line = null;
        while ((line = sr.ReadLine()) != null)
        {
            if (line.Trim() == string.Empty)
                continue;

            string[] parts = line.Split(' ');
            if (parts == null || parts.Length < 2)
                continue;

            Debug.Assert(parts.Length == 4);
            callback(parts);
        }
    }

    private void VertFileLineProcess(string[] parts)
    {
        string type = parts[0];
        if (type == "v")
            _verts.Add(new Vector3(float.Parse(parts[1]), float.Parse(parts[2]), float.Parse(parts[3])));
        else if (type == "f")
            _indicies.AddRange(new int[] { int.Parse(parts[1]) - 1, int.Parse(parts[2]) - 1, int.Parse(parts[3]) - 1 });
        else
            Debug.LogErrorFormat("unknown type [{0}] at vertfile", type);
    }

    private void NormalFileLineProcess(string[] parts)
    {
        string type = parts[0];
        if (type == "v")
            _normals.Add(new Vector3(float.Parse(parts[1]), float.Parse(parts[2]), float.Parse(parts[3])));
        else if (type == "f")
            return;
        else
            Debug.LogErrorFormat("unknown type [{0}] at normalfile", type);
    }

    private void UvFileLineProcess(string[] parts)
    {
        string type = parts[0];
        if (type == "v")
        {
            float u = float.Parse(parts[1]);
            float frac = u - Mathf.Floor(u);
            if (u < 1f)
                u = frac + 1;
            else if (u < 2f)
                u = frac + (1 << 1);
            else if (u < 3f)
                u = frac + (1 << 2);
            else if (u < 4f)
                u = frac + (1 << 3);
            else if (u < 5f)
                u = frac + (1 << 4);
            else if (u < 6f)
                u = frac + (1 << 5);
            else if (u < 7f)
                u = frac + (1 << 6);
            else if (u < 8f)
                u = frac + (1 << 7);

            _uvs.Add(new Vector3(u, float.Parse(parts[2]), float.Parse(parts[3])));
        }
        else if (type == "f")
            return;
        else
            Debug.LogErrorFormat("unknown type [{0}] at uvfile", type);
    }

    private void DrawSpace(int count)
    {
        for (int i = 0; i < count; i++)
            EditorGUILayout.Space();
    }
}
