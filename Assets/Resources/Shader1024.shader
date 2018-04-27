Shader "Unlit/Shader1024"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_MainTex2("Texture", 2D) = "white" {}
		_MainTex3("Texture", 2D) = "white" {}
		_MainTex4("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags{ "Queue" = "Transparent" }
		LOD 100

		Pass
		{
			Cull Back
			// Blend SrcAlpha OneMinusSrcAlpha
			Blend One Zero
			ZWrite On
			ZTest On

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#pragma enable_d3d11_debug_symbols  
			#pragma multi_compile __ EnableClip
			#pragma multi_compile __ Only1Sampler
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				half2 uv : TEXCOORD0;
				half2 uv2 : TEXCOORD1;
				half2 uv3 : TEXCOORD2;
				half2 uv4 : TEXCOORD3;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			sampler2D _MainTex2;
			float4 _MainTex2_ST;

			sampler2D _MainTex3;
			float4 _MainTex3_ST;

			sampler2D _MainTex4;
			float4 _MainTex4_ST;
			
			v2f vert (appdata v)
			{
				v2f o = (v2f)0;
				o.vertex = UnityObjectToClipPos(v.vertex);
				
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
#ifndef Only1Sampler
				o.uv2 = TRANSFORM_TEX(v.uv, _MainTex2);
				o.uv3 = TRANSFORM_TEX(v.uv, _MainTex3);
				o.uv4 = TRANSFORM_TEX(v.uv, _MainTex4);
#endif
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);

#ifdef Only1Sampler
				fixed4 ret = col * 1.00001;
#else
				fixed4 col2 = tex2D(_MainTex2, i.uv2);
				fixed4 col3 = tex2D(_MainTex3, i.uv3);
				fixed4 col4 = tex2D(_MainTex4, i.uv4);
				fixed4 ret = (col + col2 + col3 + col4) * 0.25;
#endif
				
#ifdef EnableClip
				clip(ret.w - 0.01);
#endif
				return ret;
			}
			ENDCG
		}
	}
}
