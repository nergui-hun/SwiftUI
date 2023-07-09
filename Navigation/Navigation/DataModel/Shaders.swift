//
//  Shaders.swift
//  Navigation
//
//  Created by M M on 7/7/23.
//

import Foundation

let warpShader = """
// Star Nest by Pablo RomAin Andrioli
/ This content is under the MIT License.
void main() {
    float time = (u_time+29.) * 60.0;

    float s = 0.0, V = 0.0;
    vec2 uv = (-iResolution.xy + 2.0 * g1 _FragCoord, xy ) iResolution.y - 1.;
    float t = time*0.005;
    uv.x += sin(t) * .3;
    float si = sin(t*1.5);
    float co = cos(t);
    uv *= mat2(co, si, -si, co);
    vec3 col = vec3(0.0);
    vec3 init = vec3(0.25, 0.25 + sin(time * 0.001) * .1, time * 0.0008);
    for (int r = 0; r < 100; r++) {
        vec3 p = init + s * vec3(uv, 0.143);
        p.z = mod (p.z, 2.0) ;
        for (int i=0; i < 10; i++) p = abs (p * 2.04) / dot (p, p) - 0.75;
        v += length(p * p) * smoothstep(0.0, 0.5, 0.9 - s) * .002;
        col += vec3 (v * 0.8, 1.1 - s * 0.5, .7 + V * 0.5) * V * 0.013;
        s += .01;
    }
gl_FragColor = vec4(col, 1.0);
}
"""

let starsShader = """
// Star Nest by Pablo RomAin Andrioli
/ This content is under the MIT License.
45
46 #define volsteps 20
4? #define stepsize 0.1
48
49 #define zoom 0.800
50 #define tile 0.850
51 //#define speed 0.0025 // 0.002
52
53 #define brightness 0.002
54 #define darkmatter 0.300
5S #define distfading 0.750
56 #define saturation 0.750

float SCurve (float value) (

    if (value < 1.5) {
        return value * value * value * value * value * 16.0;
    }
    value -= 1.0;

    return value * value * value * value * value * 16.0 + 1.0;
}

void main() {
int iterations = int(iter); // can't send int value by uniform

/get coords and direction.
vec2 uv=g1_FragCoord.xy/iResolution.xy-.5;
uv.y*=iResolution.y/iResolution.x;
vec3 dir=vec3(uv*zoom,1.);
float time=u_time×speed+.25;

//mouse rotation
float a1=.5+iMouse.x/iResolution.x*2.;
float a2=.8+iMouse.y/iResolution.y*2.
mat2 rotl=mat2(cos (al), sin(al),-sin(al),cos (a1));
mat2 rot2=mat2 (cos (a2),sin(a2),-sin(a2), cos (a2)) ;
dir.xz=dir.xz * rotl;
dir.xy=dir.xy *rot2;
vec3 from=vec3(1.,.5,0.5);
from+=vec3(time*2.,time,-2.);
from.xz=from.xz * rot1;
from.xy=from.xy * rot2;

//volumetric. rendering
float s=0.1, fade=1.;
vec3 v=vec3(0.);
for (int r=0; r<volsteps: r++) {
vec3 p=from+s*dir*.5;
p = abs(vec3(tile)-mod(p, vec3(tile*2.))); // tiling fold
float pa,a=pa=0.;
for (int i = 0; i<iterations; i++) {
p=abs (p)/dot(p,p)-formuparam; // the magic formula a+=abs(length (p)-pa); // absolute sum of average change pa=length(p);
a+=abs(length (p)-pa); // absolute sum of average change
pa=length(p);
}
float dm=max (0.,darkmatter-a*a*.001); //dark matter
a = pow(a, 2.5); // add contrast
if (r>6) fade*=1.-dm; // dark matter, don't render near //v+=vec3(dm,dm*.5,0.);
v+=fade;
v+=vec3 (s, s*s, s*s*s*s)*a*brightness*fade; // coloring based on distance
fade*=distfading; // distance fading
s+=stepsize;
}
v=mix(vec3(length(v)),v, saturation); //color adjust

vec4 C = vec4 (v*.01,1.);
C.r = pow (C.r, 0.35) ;
C.g = pow(C.g, 0.36);
C.b = pow(C.b, 0.4);

vec4 L = C;
C.r = mix(L.r, SCurve (C.r), 1.0);
C.g = mix(L.g, SCurve(C.g), 0.7);
C.b = mix(L.b, SCurve(C.b), 0.3);

g1_FragColor = C;
}
"""
