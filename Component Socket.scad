width = 47.3;
height = 38.13;
central_thickness = 2.49;
corner_radius = 5;

module socket() {
    difference() {
        union() {
            linear_extrude(central_thickness) difference() {
                minkowski() {
                    square([width-(2*corner_radius), height-(2*corner_radius)], true);
                    circle(r=5);
                }
            
                translate([0, -(height / 2) + 9.89, 0]) union() {
                    circle(r=2, $fn=100);
                    translate([(width/2) - (4/2) - 5.79, 0, 0]) circle(r=2, $fn=100);
                    translate([-(width/2) + (4/2) + 5.79, 0, 0]) circle(r=2, $fn=100);
                }
            
            
            }
            
            assign(this_height=1.6) {
                translate([0, -(height / 2) + (this_height/2), central_thickness]) cube([22.93, 1.6, 3.75], true);
            }
            
            assign(this_amount_above=6.4, this_total_height=26.4, this_width=28.95, this_top_offset=4.268, this_depth=8.3) {
                translate([0, height/2 - this_depth/2 - this_top_offset, -this_total_height + central_thickness + this_amount_above]) linear_extrude(this_total_height) {
                    square([this_width, this_depth], true);
                }
            }
            assign(this_amount_above=18.5, this_total_height=18.5, this_width=32.61, this_top_offset=10.5, this_depth=5.83) {
                translate([0, height/2 - this_depth/2 - this_top_offset, -this_total_height + central_thickness + this_amount_above]) linear_extrude(this_total_height) {
                    square([this_width, this_depth], true);
                }
            }

            translate([0, 0, central_thickness]) linear_extrude(6.4) difference() {
                minkowski() {
                    square([width-(2*corner_radius), height-(2*corner_radius)], true);
                    circle(r=5);
                }

                assign(this_corner_radius=4) {
                    minkowski() {
                        square([width-(2*this_corner_radius)-(1.6*2), height-(2*this_corner_radius)-(1.6*2)], true);
                        circle(r=this_corner_radius);
                    }
                }

                translate([0, -25.63, 0]) square([width, height], true);
            }

            translate([0, (height/2) - (6.4/2), central_thickness]) linear_extrude(6.4) square([18.55, 6.4], true);

            assign(this_amount_above=6.4, this_total_height=6.4, this_width=32.61, this_top_offset=4.268, this_depth=8.3) {
                translate([0, height/2 - this_depth/2 - this_top_offset, -this_total_height + central_thickness + this_amount_above]) linear_extrude(this_total_height) {
                    square([this_width, this_depth], true);
                }
            }

            assign(this_amount_above=0, this_total_height=18.685+1.31, this_width=17.55, this_top_offset=2.2, this_depth=4.2) {
                translate([0, height/2 - this_depth/2 - this_top_offset, -this_total_height + central_thickness + this_amount_above]) linear_extrude(this_total_height) {
                    square([this_width, this_depth], true);
                }
            }

            translate([-(17.55/2), height/2-2.2, 0]) rotate([-90, 0, -90]) linear_extrude(1.1) polygon(points=[ [0, 0], [0, 17.5], [-2.2, 0] ]);
            mirror([1, 0, 0]) translate([-(17.55/2), height/2-2.2, 0]) rotate([-90, 0, -90]) linear_extrude(1.1) polygon(points=[ [0, 0], [0, 17.5], [-2.2, 0] ]);

            translate([(32.614/2), height/2-10.5, central_thickness + 6.4]) rotate([90, 0, -90]) linear_extrude(1.83) polygon(points=[[0, 0], [0, 12.1], [-6.231, 0]]);

            mirror([1, 0, 0]) translate([(32.614/2), height/2-10.5, central_thickness + 6.4]) rotate([90, 0, -90]) linear_extrude(1.83) polygon(points=[[0, 0], [0, 12.1], [-6.231, 0]]);
        }

        // All of the cut-outs that extend the entire z axis.
        translate([0, 0, -50]) linear_extrude(100) union() {
            translate([0, -(height / 2) + 18.1, 0]) square([5.7, 3.57], true);
        
            assign(this_height=14.5) {
                translate([0, (height / 2) - (this_height/2) + 1, 0]) square([15.35, this_height + 1], true);
            }
        
            assign(this_height=2.27) {
                translate([0, (height / 2) + (this_height/2) - 8.5 - .17, 0]) square([25.35, this_height], true);
            }
        
            assign(this_height=4.1) {
                translate([0, (height / 2) - (this_height/2) - 10.45, 0]) square([28.96, this_height], true);
            }
        
            assign(this_height=6.5) {
                translate([-(width/2) + (4/2) + 12.2, -(height / 2) + (this_height/2) + 6.71, 0]) square([4, this_height], true);
                translate([(width/2) - (4/2) - 12.2, -(height / 2) + (this_height/2) + 6.71, 0]) square([4, this_height], true);
            }
        }
    }
}

module printable_socket() {
    translate( [0, 0, -central_thickness / 2] ) intersection() {
        socket();
        translate([-width / 2, -height / 2, central_thickness / 2]) cube( [ width, height, 999 ] );
    }

    translate([-width, height + 2, 0]) rotate([180, 0, 0]) translate( [width, 0, - central_thickness / 2] ) intersection() {
        socket();
        translate([-width / 2, -height / 2, -999 + (central_thickness / 2)]) cube( [ width, height, 999 ] );
    }
}

socket();
//printable_socket();