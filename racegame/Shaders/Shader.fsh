//
//  Shader.fsh
//  racegame
//

varying lowp vec4 colorVarying;

void main()
{
	gl_FragColor = colorVarying;
}
