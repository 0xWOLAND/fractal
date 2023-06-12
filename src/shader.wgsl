struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) tex_coords: vec2<f32>
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) pos: vec3<f32>,
    @location(1) tex_coords: vec2<f32>
};

@vertex
fn vs_main(
model: VertexInput
) -> VertexOutput {
    var out: VertexOutput;
    out.pos = model.position;
    out.clip_position = vec4<f32>(model.position, 1.0);
    out.tex_coords = model.tex_coords;
    return out;
}

// @fragment
// fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
//     let c = 10.0;
//     var uv = in.pos.xyz;
//     if ((i32(c * uv.x) + i32(c * uv.y)) % 2 == 0){
//         return vec4(0.5); 
//     } 
//     return vec4(uv.rgb, 1.0);
    
// }


@group(0) @binding(0)
var t_diffuse: texture_2d<f32>;
@group(0)@binding(1)
var s_diffuse: sampler;

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    return textureSample(t_diffuse, s_diffuse, in.tex_coords);
}