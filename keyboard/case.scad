*difference(){
    translate([0,0,9]) top_plate();
    all_bolt_holes();
}

union(){
    battery_slot();
    bottom_plate_micro_controller_slot();
    difference(){
        bottom_plate();
        all_bolt_holes();
        #all_bolt_hole_counter_sinks();
        }
}

*battery();
*key_switch();
*translate([120,55,3]) {
    micro_controller();
}


module fillet(radius=8){
    translate([0, 0, -5]) linear_extrude( 10 ){
            difference(){
                square(radius*2);
                circle(radius);
            }
        }
}
module top_plate(){
    difference(){
        minkowski(){
            color("#ccc") import("cad.stl");
            cylinder(r=.1, h=0.001);
         }
        translate([123.2, 8.4, 0]) rotate([0,0,-90]) fillet();
        translate([123.2,84, 0]) rotate([0,0,0]) fillet();
        translate([8, 29.9, 0]) rotate([0,0,-180]) fillet();
        translate([8,84, 0]) rotate([0,0,90]) fillet();    
        translate([0,0,-2]) minkowski(){
            cube([60, 20, 5]);
            cylinder(r=2, h=1);
         }
            
        translate([80,-50,-5]) cylinder(r=62, h=10);
        translate([71.5,21, 0]) rotate([0,0,180]) fillet(10);  
        }
    }

module bottom_plate(){
    translate([0,0,0]) difference(){
        translate([0,0.5,0]) color("#aaa") cube([131,91.6,3]);
        translate([123.2, 8.4, 0]) rotate([0,0,-90]) fillet();
        translate([123.2,84, 0]) rotate([0,0,0]) fillet();
           
        translate([0,0,-2]) minkowski(){
            cube([60, 20, 5]);
            cylinder(r=2, h=1);
         }
            
        translate([80,-50,-5]) cylinder(r=62, h=10);
        translate([71.5,21, 0]) rotate([0,0,180]) fillet(10); 
    }
 }
 module battery_slot(){
     union(){
         difference(){
                    translate([-20,21.98,0]) color("#aaa") cube([21,70,7]);
                    translate([-10,25,8]) rotate([-90,0,0]) cylinder(r=8, h=65);
                    translate([-15,80,3]) cube([20,10,5]);
                    // fillets ----
                    translate([-17, 24.8, 3]) rotate([0,0,-180]) fillet(3);
                    translate([-17.1,89, 3]) rotate([0,0,90]) fillet(3); 
             }
             //clip points
             translate([-10,93,4.5]) difference(){
                 translate([0,0,0]) cube([10,2,5], center=true);
                 translate([0,1,0]) rotate([20,0,0]) cube([12,2,10], center=true);
               }
               translate([-10,21,4.5]) difference(){
                    translate([0,0,0]) cube([10,2,5], center=true);
                    translate([0,-1,0]) rotate([-20,0,0]) cube([12,2,10], center=true);
              }
    }
 }
 module battery(){
     translate([-10,25,7.25]) rotate([-90,0,0]) color("#55f") cylinder(r=7.25, h=51);
}
module key_switch(){
    translate([10,38.5,4.5]) rotate([0,0,-90]) import("kailhlowprofilev102.stl");
}
module m2_standoff(height=14, width=2.2){
    cylinder(r=width/2,h=height, $fn = 20);
 }

module all_bolt_holes(){   
    // outer standoffs
standoff_height =-2;
translate([10,26,standoff_height]) m2_standoff();
translate([60,27,standoff_height]) m2_standoff();
translate([35,26,standoff_height]) m2_standoff();
translate([127,7,standoff_height]) m2_standoff();
translate([127,40,standoff_height]) m2_standoff();
translate([127,85,standoff_height]) m2_standoff();
translate([95.5,87,standoff_height]) m2_standoff();
translate([57.25,87,standoff_height]) m2_standoff();
translate([10,87,standoff_height]) m2_standoff();

// inner standoffs
translate([57,52,standoff_height]) m2_standoff();
translate([95,52,standoff_height]) m2_standoff();
}
module micro_controller(){
    color("#5f5") import("nRF52840.3mf");
}
module bottom_plate_micro_controller_slot(){
    difference(){
        translate([120+ -18.5,55+1.8,3+0]) cube([25,35,3]);
        translate([120+ -16,55+3,3+1]) cube([20,35,3]);
        translate([127,85,0]) m2_standoff();
    }
}
module all_bolt_hole_counter_sinks(){
    // outer standoffs
        standoff_height =-.1;
        phys_height = 1.2;
        phys_width = 3.75;
        translate([10,26,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([60,27,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([35,26,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([127,7,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([127,40,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([127,85,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([95.5,87,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([57.25,87,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([10,87,standoff_height]) m2_standoff(phys_height, phys_width);

        // inner standoffs
        translate([57,52,standoff_height]) m2_standoff(phys_height, phys_width);
        translate([95,52,standoff_height]) m2_standoff(phys_height, phys_width);
    }
   