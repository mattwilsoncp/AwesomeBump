#version 400  core

uniform samplerCube texEnv;


in vec3 texcoord;
in vec3 pos;
layout(location = 0) out vec4 FragColor;
layout(location = 1) out vec4 FragNormal;
layout(location = 2) out vec4 FragGlowColor;
void main( void )
{ 
   FragColor  = texture(texEnv, texcoord);
   FragNormal = vec4(0,0,1,1);

   float bloomLevel = 0.8;
   //FragGlowColor = pow(FragColor+0.2,vec4(3.0))-pow(1.1,3)+1;

   FragGlowColor = 1.4*smoothstep(vec4(bloomLevel),vec4(bloomLevel)+0.2,pow(FragColor,vec4(2)));
}
