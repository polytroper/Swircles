// Shadergator first shader practice
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    float t = iTime;
    vec3 paint = vec3(0, (sin(t)+1.0)/2.0, 1);
    float aspect = iResolution.x/iResolution.y;
    vec2 aspect2 = vec2(iResolution.x/iResolution.y, 1.0);
    vec2 uv = fragCoord / iResolution.xy;
    vec2 center = vec2(0.5, 0.5);
    vec2 tileSize = vec2(0.2, 0.2);
    
    vec2 uvWave = uv+vec2(sin(t-uv.y)/2.0, sin(t*0.4-uv.x)/2.0);
    vec2 uvp = mod(uvWave/tileSize*aspect2, 1.0);
    vec2 uvc = uvp*2.0-vec2(1.0);
    float a = atan(uvc.x, uvc.y);
    float m = 0.5+0.2*((sin(a*4.0+(t+uv.x*5.0+uv.y*2.0))+1.0)/2.0);

    vec2 point = (uvp-center);
    float circle = round(mod(m+(length(point)+t/8.0)*2.0, 0.5)*1.5);
    
    vec2 uvr = mod(abs(uvp*2.0-1.0), 1.0);
    float rect = round(max(uvr.x, uvr.y)-0.4);

    float mixed = max(circle, rect);
    fragColor = vec4(paint*circle, 1.0);
    fragColor = vec4((vec3(uvp, ((sin(t)+1.0)/2.0))+vec3(((cos(t)+1.0)/2.0), uv))*mixed, 0);
    // fragColor += (1.0-mixed)*vec4(0.0, uv, 1.0);
    // fragColor = vec4(mixed);
}
