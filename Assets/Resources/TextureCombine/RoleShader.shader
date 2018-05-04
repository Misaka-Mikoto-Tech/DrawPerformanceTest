Shader "RoleShader"
{
	Properties
	{
		_Tex0 ("_Tex0", 2D) = "white" {}
		_Tex1 ("_Tex1", 2D) = "white" {}
		_Tex2 ("_Tex2", 2D) = "white" {}
		_Tex3 ("_Tex3", 2D) = "white" {}
		_Tex4 ("_Tex4", 2D) = "white" {}
		_Tex5 ("_Tex5", 2D) = "white" {}
		_Tex6 ("_Tex6", 2D) = "white" {}
		_Tex7 ("_Tex7", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile __ SampleAll
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				half2 uv : TEXCOORD0;
				half3 normal : TEXCOORD1;
				fixed4 switch0 : TEXCOORD2;
				fixed4 switch1 : TEXCOORD3;
			};

			sampler2D _Tex0;
			sampler2D _Tex1;
			sampler2D _Tex2;
			sampler2D _Tex3;
			sampler2D _Tex4;
			sampler2D _Tex5;
			sampler2D _Tex6;
			sampler2D _Tex7;
			
			v2f vert (appdata v)
			{
				v2f o = (v2f)0;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;

				int flag = floor(v.uv);
				o.switch0 = fixed4(flag & 1, (flag & 1 << 1) >> 1, (flag & 1 << 2) >> 2, (flag & 1 << 3) >> 3);
				o.switch1 = fixed4((flag & 1 << 4) >> 4, (flag & 1 << 5) >> 5, (flag & 1 << 6) >> 6, (flag & 1 << 7) >> 7);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = fixed4(0,0,0,0);

#ifndef SampleAll
				// if(i.switch0.x > 0)
				// 	col = tex2D(_Tex0, i.uv);
				// if(i.switch0.y > 0)
				// 	col = tex2D(_Tex1, i.uv);
				// if(i.switch0.z > 0)
				// 	col = tex2D(_Tex2, i.uv);
				// if(i.switch0.w > 0)
				// 	col = tex2D(_Tex3, i.uv);
				// if(i.switch1.x > 0)
				// 	col = tex2D(_Tex4, i.uv);
				// if(i.switch1.y > 0)
				// 	col = tex2D(_Tex5, i.uv);
				// if(i.switch1.z > 0)
				// 	col = tex2D(_Tex6, i.uv);
				// if(i.switch1.w > 0)
				// 	col = tex2D(_Tex7, i.uv);

				// if(i.switch0.x > 0)
				// 	col = dot(i.switch0, i.uv.xyxy);
				// if(i.switch0.y > 0)
				// 	col = dot(i.switch0, i.uv.xyxx);
				// if(i.switch0.z > 0)
				// 	col = dot(i.switch0, i.uv.xxxx);
				// if(i.switch0.w > 0)
				// 	col = dot(i.switch0, i.uv.yyyy);
				// if(i.switch1.x > 0)
				// 	col = dot(i.switch1, i.uv.xyxy);
				// if(i.switch1.y > 0)
				// 	col = dot(i.switch1, i.uv.xyxx);
				// if(i.switch1.z > 0)
				// 	col = dot(i.switch1, i.uv.xxxx);
				// if(i.switch1.w > 0)
				// 	col = dot(i.switch0, i.uv.yyyy);

				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);	
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);	
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);	
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);	
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				if(i.switch0.x < -10)
					col = fixed4(1,1,1,1);
				if(i.switch0.y < -100)
					col = fixed4(1,0,1,1);
				if(i.switch0.z < -11)
					col = fixed4(1,1,0,1);
				if(i.switch0.w < -12)
					col = fixed4(1,0,0,1);
				
#else
				// col += i.switch0;
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				col += dot(i.switch0, i.uv.xxyx);
				col += dot(i.switch0, i.uv.xyxy);
				col += dot(i.switch1, i.uv.xyxx);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.xyyx);
				col += dot(i.switch1, i.uv.xyxy);
				col += dot(i.switch0, i.uv.xxxy);
				col += dot(i.switch1, i.uv.yyxy);
				

				// col += dot(i.switch0, i.uv.xyxy);
				// col += dot(i.switch0, i.uv.xyxx);
				// col += dot(i.switch1, i.uv.xxxx);
				// col += dot(i.switch0, i.uv.yyyy);
				// col += dot(i.switch1, i.uv.xyxy);
				// col += dot(i.switch1, i.uv.xyxx);
				// col += dot(i.switch1, i.uv.xxxx);
				// col += dot(i.switch1, i.uv.yyyy);

				// col += tex2D(_Tex0, i.uv) * i.switch0.x;
				// col += tex2D(_Tex1, i.uv) * i.switch0.y;
				// col += tex2D(_Tex2, i.uv) * i.switch0.z;
				// col += tex2D(_Tex3, i.uv) * i.switch0.w;
				// col += tex2D(_Tex4, i.uv) * i.switch1.x;
				// col += tex2D(_Tex5, i.uv) * i.switch1.y;
				// col += tex2D(_Tex6, i.uv) * i.switch1.z;
				// col += tex2D(_Tex7, i.uv) * i.switch1.w;

				
#endif
				return col;
			}
			ENDCG
		}
	}
}
