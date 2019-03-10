Shader "MaskedTexture" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _Mask ("Culling Mask", 2D) = "white" { }
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.1
}
SubShader { 
 Tags { "QUEUE"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 41697
Program "vp" {
SubProgram "d3d9 " {
"!!DX9VertexSM20
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   float4 _MainTex_ST;
					//   float4 _Mask_ST;
					//   row_major float4x4 glstate_matrix_mvp;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   glstate_matrix_mvp c0       4
					//   _Mask_ST           c4       1
					//   _MainTex_ST        c5       1
					//
					
					    vs_2_0
					    def c6, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    mad oT0.xy, v1, c4, c4.zwzw
					    mad oT1.xy, v1, c5, c5.zwzw
					    mad r0, v0.xyzx, c6.xxxy, c6.yyyx
					    dp4 oPos.x, c0, r0
					    dp4 oPos.y, c1, r0
					    dp4 oPos.z, c2, r0
					    dp4 oPos.w, c3, r0
					    mov oD0, c6.yyyx
					
					// approximately 8 instruction slots used"
}
SubProgram "d3d11 " {
"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyz         0     NONE   float   xyz 
					// TEXCOORD                 0   xyz         1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// SV_POSITION              0   xyzw        2      POS   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[8], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output o0.xyzw
					dcl_output o1.xy
					dcl_output o1.zw
					dcl_output_siv o2.xyzw, position
					dcl_temps 1
					mov o0.xyzw, l(0,0,0,1.000000)
					mad o1.xy, v1.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mad o1.zw, v1.xxxy, cb0[7].xxxy, cb0[7].zzzw
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add o2.xyzw, r0.xyzw, cb1[3].xyzw
					ret 
					// Approximately 0 instruction slots used"
}
SubProgram "d3d11_9x " {
"!!DX10Level9Vertex
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyz         0     NONE   float   xyz 
					// TEXCOORD                 0   xyz         1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// SV_POSITION              0   xyzw        2      POS   float   xyzw
					//
					//
					// Constant buffer to DX9 shader constant mappings:
					//
					// Target Reg Buffer  Start Reg # of Regs        Data Conversion
					// ---------- ------- --------- --------- ----------------------
					// c1         cb0             6         2  ( FLT, FLT, FLT, FLT)
					// c3         cb1             0         4  ( FLT, FLT, FLT, FLT)
					//
					//
					// Runtime generated constant mappings:
					//
					// Target Reg                               Constant Description
					// ---------- --------------------------------------------------
					// c0                              Vertex Shader position offset
					//
					//
					// Level9 shader bytecode:
					//
					    vs_2_0
					    def c7, 0, 1, 0, 0
					    dcl_texcoord v0
					    dcl_texcoord1 v1
					    mad oT1.xy, v1, c1, c1.zwzw
					    mad oT1.zw, v1.xyyx, c2.xyyx, c2.xywz
					    mul r0, v0.y, c4
					    mad r0, c3, v0.x, r0
					    mad r0, c5, v0.z, r0
					    add r0, r0, c6
					    mad oPos.xy, r0.w, c0, r0
					    mov oPos.zw, r0
					    mov oT0, c7.xxxy
					
					// approximately 9 instruction slots used
					vs_4_0
					dcl_constantbuffer CB0[8], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output o0.xyzw
					dcl_output o1.xy
					dcl_output o1.zw
					dcl_output_siv o2.xyzw, position
					dcl_temps 1
					mov o0.xyzw, l(0,0,0,1.000000)
					mad o1.xy, v1.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mad o1.zw, v1.xxxy, cb0[7].xxxy, cb0[7].zzzw
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add o2.xyzw, r0.xyzw, cb1[3].xyzw
					ret 
					// Approximately 0 instruction slots used"
}
}
Program "fp" {
SubProgram "d3d9 " {
"!!DX9PixelSM20
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
					//
					// Parameters:
					//
					//   float _Cutoff;
					//   sampler2D _MainTex;
					//   sampler2D _Mask;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Cutoff      c0       1
					//   _Mask        s0       1
					//   _MainTex     s1       1
					//
					
					    ps_2_0
					    def c1, -0, -1, 0, 0
					    dcl t0.xy
					    dcl t1.xy
					    dcl_2d s0
					    dcl_2d s1
					    texld_pp r0, t0, s0
					    add r1.w, r0.w, -c0.x
					    cmp r1, r1.w, c1.x, c1.y
					    texkill r1
					    texld_pp r1, t1, s1
					    mov_pp r0.xyz, r1
					    mov_pp oC0, r0
					
					// approximately 7 instruction slots used (2 texture, 5 arithmetic)"
}
SubProgram "d3d11 " {
"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float       
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// SV_POSITION              0   xyzw        2      POS   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[9], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_input_ps linear v1.xy
					dcl_input_ps linear v1.zw
					dcl_output o0.xyzw
					dcl_temps 1
					sample r0.xyzw, v1.xyxx, t0.xyzw, s0
					lt r0.x, r0.w, cb0[8].x
					mov o0.w, r0.w
					discard_nz r0.x
					sample r0.xyzw, v1.zwzz, t1.xyzw, s1
					mov o0.xyz, r0.xyzx
					ret 
					// Approximately 0 instruction slots used"
}
SubProgram "d3d11_9x " {
"!!DX10Level9Pixel
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float       
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// SV_POSITION              0   xyzw        2      POS   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					//
					// Constant buffer to DX9 shader constant mappings:
					//
					// Target Reg Buffer  Start Reg # of Regs        Data Conversion
					// ---------- ------- --------- --------- ----------------------
					// c0         cb0             8         1  ( FLT, FLT, FLT, FLT)
					//
					//
					// Sampler/Resource to DX9 shader sampler mappings:
					//
					// Target Sampler Source Sampler  Source Resource
					// -------------- --------------- ----------------
					// s0             s0              t0               
					// s1             s1              t1               
					//
					//
					// Level9 shader bytecode:
					//
					    ps_2_0
					    def c1, -0, -1, 0, 0
					    dcl t1
					    dcl_2d s0
					    dcl_2d s1
					    texld_pp r0, t1, s0
					    add r1.w, r0.w, -c0.x
					    cmp r1, r1.w, c1.x, c1.y
					    mov r2.xy, t1.wzyx
					    texkill r1
					    texld_pp r1, r2, s1
					    mov_pp r0.xyz, r1
					    mov_pp oC0, r0
					
					// approximately 8 instruction slots used (2 texture, 6 arithmetic)
					ps_4_0
					dcl_constantbuffer CB0[9], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_input_ps linear v1.xy
					dcl_input_ps linear v1.zw
					dcl_output o0.xyzw
					dcl_temps 1
					sample r0.xyzw, v1.xyxx, t0.xyzw, s0
					lt r0.x, r0.w, cb0[8].x
					mov o0.w, r0.w
					discard_nz r0.x
					sample r0.xyzw, v1.zwzz, t1.xyzw, s1
					mov o0.xyz, r0.xyzx
					ret 
					// Approximately 0 instruction slots used"
}
}
 }
}
}