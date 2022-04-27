#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
	vec4 col = texture2D(CC_Texture0, v_texCoord);
	float grey = dot(col.rgb, vec3(0.299, 0.587, 0.114));
	float alpha = v_fragmentColor.a;
    gl_FragColor = vec4(grey * alpha, grey * alpha, grey * alpha, col.a * alpha);
}