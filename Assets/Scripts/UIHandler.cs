using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIHandler : MonoBehaviour {

    public Button btnIncBatch;
    public Button btnDecBatch;
    public Toggle tgDraw2048;
    public Toggle tg2048Nearby;
    public Toggle tgForceLod3;
    public Toggle tgEnableClip;

    public Text   txtDrawCount;
    public Text   txtSupportInstancing;

    public TestDaw testDraw;

    private int _currDrawCount;

    private void Start()
    {
        string strInstancing = SystemInfo.supportsInstancing ? "Yes" : "No";
        txtSupportInstancing.text = $@"Support GPUInstancing:{strInstancing}";

        btnIncBatch.onClick.AddListener(OnBtnIncBatchClick);
        btnDecBatch.onClick.AddListener(OnBtnDecBatchClick);
        tgDraw2048.onValueChanged.AddListener(OnDraw2048Changed);
        tg2048Nearby.onValueChanged.AddListener(OnTg2048NearbyChanged);
        tgForceLod3.onValueChanged.AddListener(OnForceLod3Changed);
        tgEnableClip.onValueChanged.AddListener(OnTgEnableClipChanged);
    }

    private void OnBtnIncBatchClick()
    {
        testDraw.batchCount++;
    }

    private void OnBtnDecBatchClick()
    {
        testDraw.batchCount--;
    }

    private void OnDraw2048Changed(bool value)
    {
        testDraw.draw2048 = value;

        tg2048Nearby.gameObject.SetActive(value);
        tgForceLod3.gameObject.SetActive(value);
    }

    private void OnTg2048NearbyChanged(bool value)
    {
        testDraw.Set2048Nearby(value);
    }

    private void OnForceLod3Changed(bool value)
    {
        testDraw.SetForceLod3(value);
    }

    private void OnTgEnableClipChanged(bool value)
    {
        testDraw.SetEnableClip(value);
    }

    private void Update()
    {
        if(_currDrawCount != testDraw.drawCount)
        {
            _currDrawCount = testDraw.drawCount;
            txtDrawCount.text = _currDrawCount.ToString();
        }
    }
}
