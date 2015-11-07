﻿Shader "Hidden/Drunk"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;


			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 a = tex2D(_MainTex, i.uv);
				fixed4 b = tex2D(_MainTex, i.uv * (1 + sin(_Time.z * 3) / 100));
				fixed4 c = tex2D(_MainTex, i.uv * (1 + cos(_Time.z * 3) / 100));
				return a * b * c;
			}
			ENDCG
		}
	}
}
