using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TestRoleCombine : MonoBehaviour {

    public Toggle tgSampleAll;
    public Text txtAvgFps;

    public GameObject go;

    private List<GameObject>    _gos;
    private List<Material>      _mats;

    private const float RND_RANGE = 0.3f;

    private float _beginTime;
    private int _beginFrame;
    private bool _counting;

    void Start () {
        Application.targetFrameRate = 1000;

        tgSampleAll.onValueChanged.AddListener(OnTgSampleAllChanged);

        Spawn();
    }

    private void Spawn()
    {
        _gos = new List<GameObject>();
        _mats = new List<Material>();

        _gos.Add(go);
        _mats.Add(go.transform.GetChild(0).GetComponent<MeshRenderer>().material);

        Random.InitState(System.DateTime.Now.Millisecond);
        for(int x = -20; x < 20; x++)
        {
            for(int y = -5; y < 5; y++)
            {
                for(int i = 0; i < 2; i++)
                {
                    GameObject tmpGo = Instantiate(go);
                    tmpGo.transform.position = new Vector3(x * 0.4f + Random.Range(RND_RANGE * -1f, RND_RANGE), y * 0.6f + Random.Range(RND_RANGE * -1f, RND_RANGE), 2 + Random.Range(-1f, 1f));
                    _gos.Add(tmpGo);
                    _mats.Add(tmpGo.transform.GetChild(0).GetComponent<MeshRenderer>().material);
                }
            }
        }
    }
	
	private void OnTgSampleAllChanged(bool value)
    {
        foreach(var mat in _mats)
        {
            if (value)
                mat.EnableKeyword("SampleAll");
            else
                mat.DisableKeyword("SampleAll");
        }

        txtAvgFps.text = "Counting...";
        _beginTime = Time.time;
        _beginFrame = Time.frameCount;
        _counting = true;

    }

    private void Update()
    {
        if (!_counting)
            return;

        if(Time.time - _beginTime > 60f)
        {
            int cnt = Time.frameCount - _beginFrame;
            txtAvgFps.text = (cnt / 60f).ToString();
            _counting = false;
        }
    }
}
