// Shadergator first shader practice
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    float t = iTime;
    vec3 paint = vec3(0, (sin(t)+1.0)/2.0, 1);
    float aspect = iResolution.x/iResolution.y;
    vec2 aspect2 = vec2(iResolution.x/iResolution.y, 1.0);
    vec2 uv = fragCoord / iResolution.xy;
    vec2 center = vec2(0.5+0.2*sin(t), 0.5);
    vec2 tileSize = vec2(0.2, 0.2);
    
    vec2 uvWave = uv+vec2(0, sin(t));
    vec2 uvp = mod(uvWave/tileSize*aspect2, 1.0);

    vec2 point = (uvp-center);
    float circle = 1.0 - smoothstep(0.24, 0.25, length(point));
    // fragColor = vec4(paint*circle, 1.0);
    fragColor = vec4(uvp, 0, 0);
}
