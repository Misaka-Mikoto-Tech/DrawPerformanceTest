Shader "Unlit/Shader2048"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
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
			ZWrite Off
			ZTest Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#pragma multi_compile __ Enable_2048Nearby
			#pragma multi_compile __ ForceLod3
			#pragma multi_compile __ EnableClip
			
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
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);

#ifdef Enable_2048Nearby
				o.uv2 = o.uv + half2(0.00001, 0);
				o.uv3 = o.uv + half2(0.00001, 0.00001);
				o.uv4 = o.uv + half2(0, 0.00001);
#else
				o.uv2 = o.uv + half2(0.5, 0);
				o.uv3 = o.uv + half2(0, 0.5);
				o.uv4 = o.uv + half2(0.5, 0.5);
#endif
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
#ifndef ForceLod3
				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 col2 = tex2D(_MainTex, i.uv2);
				fixed4 col3 = tex2D(_MainTex, i.uv3);
				fixed4 col4 = tex2D(_MainTex, i.uv4);
#else
				fixed4 col = tex2Dlod(_MainTex, float4(i.uv, 0, 3));
				fixed4 col2 = tex2Dlod(_MainTex, float4(i.uv2, 0, 3));
				fixed4 col3 = tex2Dlod(_MainTex, float4(i.uv3, 0, 3));
				fixed4 col4 = tex2Dlod(_MainTex, float4(i.uv4, 0, 3));
#endif
				fixed4 ret = (col + col2 + col3 + col4) * 0.25;
#ifdef EnableClip
				if(ret.w < 0.01)
				{
					discard;
				}
#endif
				return ret;
			}
			ENDCG
		}
	}
}
