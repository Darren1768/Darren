#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    vec4 col = texture2D(CC_Texture0, v_texCoord);
	vec4 normalColor = v_fragmentColor * col;
    normalColor *= vec4(0.5, 0.5, 0.5, 1);
    normalColor.b += normalColor.a * 0.3;
    gl_FragColor = normalColor;
}