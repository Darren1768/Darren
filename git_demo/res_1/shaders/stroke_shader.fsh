#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;  
varying vec2 v_texCoord;  
uniform float outlineSize;  
uniform vec3 outlineColor;  
uniform vec2 textureSize;  
uniform vec3 foregroundColor;  
    
int getIsStrokeWithAngelIndex(float angel)  
{
    float rad = angel * 0.01745329252;
    int stroke = 0;  
    float a = texture2D(CC_Texture0, vec2(v_texCoord.x + outlineSize * cos(rad) / textureSize.x, v_texCoord.y + outlineSize * sin(rad) / textureSize.y)).a;  
    if (a >= 0.5)  
    {  
        stroke = 1;  
    }  
  
    return stroke;  
}  
  
void main()  
{  
    vec4 myC = texture2D(CC_Texture0, vec2(v_texCoord.x, v_texCoord.y));  
    myC.rgb *= foregroundColor;  
    if (myC.a >= 0.5)  
    {  
        gl_FragColor = v_fragmentColor * myC;  
        return;  
    }  
  
    int strokeCount = 0;  
    strokeCount += getIsStrokeWithAngelIndex(0.0);  
    strokeCount += getIsStrokeWithAngelIndex(30.0);  
    strokeCount += getIsStrokeWithAngelIndex(60.0);  
    strokeCount += getIsStrokeWithAngelIndex(90.0);  
    strokeCount += getIsStrokeWithAngelIndex(120.0);  
    strokeCount += getIsStrokeWithAngelIndex(150.0);  
    strokeCount += getIsStrokeWithAngelIndex(180.0);  
    strokeCount += getIsStrokeWithAngelIndex(210.0);  
    strokeCount += getIsStrokeWithAngelIndex(240.0);  
    strokeCount += getIsStrokeWithAngelIndex(270.0);  
    strokeCount += getIsStrokeWithAngelIndex(300.0);  
    strokeCount += getIsStrokeWithAngelIndex(330.0);  
  
    if (strokeCount > 0)  
    {  
        myC.rgb = outlineColor;  
        myC.a = 1.0;   
    }  
    gl_FragColor = v_fragmentColor * myC;  
}