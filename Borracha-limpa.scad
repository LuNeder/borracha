// Higher definition curves
$fs = 0.01;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}







difference() {
    roundedcube([39, 70, 17.5], center=true, apply_to="xmin", radius=2.5);
    
    translate([0, 9, 0])
        cube([34.35, 85, 13], center=true);
    
    translate([20, -29, 0])
              cube([10, 10, 12.5], center=true);
    
    translate([-28.79, -7, 0])
        scale([01.07,02,01])
            sphere(r=10);
    
    translate([-24, 16, 0])
        rotate([0, 90, 0])
            cylinder(20, r=5);
              
    
};

difference() {
    translate([0, -1, 0])
        cube([34.5, 4.2, 17], center=true);
    
    cube([32, 10, 11], center=true);

};
difference() {
    translate([22, 15, 0])
        roundedcube([10, 100, 17.5], center=true, radius=2.5, apply_to="ymin");

    translate([20.82, 17, 0])
        cube([8.57, 100, 12.5], center=true);
    
    translate([16.5, 46.8, -10])
        rotate([0, 0, 60])
        cube([40, 10 , 20]);
    
    translate([36.3, -7, 0])
        scale([0.107,0.2,0.1])
            sphere(r=100);

};

difference() {
    translate([22, 42.5, 0])
        cube([10, 50, 17.5], center=true);

    translate([20.82, 17, 0])
        cube([8.57, 100, 12.5], center=true);
    
    translate([16.5, 46.8, -10])
        rotate([0, 0, 60])
        cube([40, 10 , 20]);
    
    translate([36.62, 0, 0])
        scale([0.107,0.2,0.1])
            sphere(r=100);

};




