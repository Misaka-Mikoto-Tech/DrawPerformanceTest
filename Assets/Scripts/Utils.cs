using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum RenderingMode
{
    Opaque,
    Transparent,
}

public static class Utils
{
    public static void SetMaterialRenderingMode(Material material, RenderingMode renderingMode)
    {
        switch (renderingMode)
        {
            case RenderingMode.Opaque:
                material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                material.SetInt("_ZTest", (int)UnityEngine.Rendering.CompareFunction.LessEqual);
                material.SetInt("_ZWrite", 1);
                material.renderQueue = 2000;
                break;
            case RenderingMode.Transparent:
                material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                material.SetInt("_ZTest", (int)UnityEngine.Rendering.CompareFunction.Disabled);
                material.SetInt("_ZWrite", 0);
                material.renderQueue = 3000;
                break;
        }
    }
}
