use fractal::run;
use pollster;

fn main() {
    pollster::block_on(run());
}
