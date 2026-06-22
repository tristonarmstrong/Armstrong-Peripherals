// standoff with hole
*difference(){
        translate([10, 25, 3]) m2_standoff(height=6.25, width=4);
        translate([10, 25, 0]) m2_standoff(height=10, width=2.4);
}
difference(){
    union(){
            translate([0,0,9]) {
                top_plate();
                // micro_controller slot drop
                translate([114,57,-1.5]){
                    cube([20,35,2]);
                    }
                }
        }
        // micro controller slot cutouts
        translate([114.5,57.5,8]){
            cube([19,34,3]);
            translate([4.5, 30, .5]) cube([10,5,3]);
            translate([17, 0, -2]) cube([1.5,33,4]);
            translate([.8, 0, -2]) cube([1.5,33,4]);
        }
    all_bolt_holes();
}

union(){
    battery_slot();
    difference(){
        bottom_plate();
        all_bolt_holes();
        }
}


*battery();
*key_switch();
micro_controller();



module fillet(radius=8){
    translate([0, 0, -5]) linear_extrude( 10 ){
            difference(){
                square(radius*2);
                circle(radius);
            }
        }
}
module top_plate(){
    union(){
        difference(){
                translate([130, .32, -.65]) cube([10, 91.8, 1.3]);
                translate([142-10, 8.4, 0]) rotate([0,0,-90]) fillet();
                translate([142-10,84, 0]) rotate([0,0,0]) fillet();
            }
        difference(){
            // minkowski shrinks the key slots ever so slightly
            minkowski(){
                color("#ccc") import("cad.stl");
                cylinder(r=.1, h=0.001);
             }
            
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
    }

module bottom_plate(){
    translate([0,0,0]) difference(){
        translate([0,0.5,0]) color("#aaa") cube([140,91.6,3]);
        translate([142-10, 8.4, 0]) rotate([0,0,-90]) fillet();
        translate([142-10,84, 0]) rotate([0,0,0]) fillet();
           
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
                    translate([-10,25,9]) rotate([-90,0,0]) cylinder(r=8, h=65);
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
    translate([0,0,1.9]) cylinder(r=3.9/2,h=1.2, $fn = 20);
 }

module all_bolt_holes(height=14, width=2.4){   
    // outer standoffs
    standoff_height =-2;
    translate([10,26,standoff_height]) m2_standoff(height, width);
    translate([19,60,standoff_height]) m2_standoff(height, width);
    translate([60,27,standoff_height]) m2_standoff(height, width);
    translate([35,26,standoff_height]) m2_standoff(height, width);
    translate([105,9.5,standoff_height]) m2_standoff(height, width);
    translate([86,14.5,standoff_height]) m2_standoff(height, width);
    translate([116.5,40,standoff_height]) m2_standoff(height, width);
    translate([137,7,standoff_height]) m2_standoff(height, width);
    translate([137,40,standoff_height]) m2_standoff(height, width);
    translate([137,85,standoff_height]) m2_standoff(height, width);
    translate([95.5,87,standoff_height]) m2_standoff(height, width);
    translate([57.1,89,standoff_height]) m2_standoff(height, width);
    translate([10,89,standoff_height]) m2_standoff(height, width);

    // inner standoffs
    translate([57,52,standoff_height]) m2_standoff();
    translate([95,52,standoff_height]) m2_standoff();
}
module micro_controller(){
    translate([130,54.5,8.5]) {
        translate([2,3.5,-2]) {
            for (pin = [0:12]) translate([0,2.6*pin,0]) cube([.5,.5,4]);
            }
         translate([-14.25,3.5,-2]) {
            for (pin = [0:12]) translate([0,2.6*pin,0]) cube([.5,.5,4]);
        }
    color("#5f5") import("nRF52840.3mf");
    }
}
