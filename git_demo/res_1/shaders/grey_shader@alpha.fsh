#ifdef GL_ES
    precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    vec4 texColor = texture2D(CC_Texture0, v_texCoord);
    texColor.a = texture2D(CC_Texture1, v_texCoord).r;
    texColor.rgb *= texColor.a; // premultiply alpha channel
    
    texColor = v_fragmentColor * texColor;
    
    float grey = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
	float alpha = v_fragmentColor.a;
	gl_FragColor = vec4(grey * alpha, grey * alpha, grey * alpha, texColor.a * alpha);
}

