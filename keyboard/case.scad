difference(){
    translate([0,0,9]) top_plate();
    all_bolt_holes();
}

*union(){
    battery_slot();
    difference(){
        bottom_plate();
        all_bolt_holes();
        }
}

*battery();
*key_switch();

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
     difference(){
                translate([-20,21.98,0]) color("#aaa") cube([21,70,7]);
                translate([-10,25,8]) rotate([-90,0,0]) cylinder(r=8, h=65);
                translate([-15,80,3]) cube([20,10,5]);
                // fillets ----
                translate([-17, 24.8, 3]) rotate([0,0,-180]) fillet(3);
                translate([-17.1,89, 3]) rotate([0,0,90]) fillet(3); 
         }
 }
 module battery(){
     translate([-10,25,7.25]) rotate([-90,0,0]) color("#55f") cylinder(r=7.25, h=51);
}
module key_switch(){
    translate([10,38.5,4.5]) rotate([0,0,-90]) import("kailhlowprofilev102.stl");
}
module m2_standoff(){
    cylinder(r=1,h=14, $fn = 20);
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