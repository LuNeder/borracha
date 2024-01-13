// Caixa editada a partir de hansamann (https://www.instructables.com/Creating-a-custom-sized-box-for-3D-printing-with-O/)

$fn=200;

length = 150;
width= 140;
height = 50;
cornerRadius = 10;

translate([10, 10, 0]){
    difference() {
            roundedBox(length, width, height, cornerRadius); 
            translate([1,1,1]) {
                roundedBox(length-2, width-2, height-1, cornerRadius); 
            }
    }
}


translate([width*2, 10, 0]){
    difference(){
    mirror([1,0,0]) {
        roundedBox(length, width, 1, cornerRadius);
        difference() {
            translate([1,1,0]) {
                roundedBox(length-2,width-2,4,cornerRadius);
            }
            translate([2,2,0]) {
                roundedBox(length-4,width-4,4,cornerRadius);
            }    
        

            
            
            
            }
    }

              //DESENHO
    translate([-15, 38/2, -9.5])//
        cube([20.2/2, 5, 10]);
    translate([-35.9, ((38.45+10)/2)+5, -9.5])//
        cube([70/2, 5, 10]);
    translate([-5, ((38)/2), -9.5])//
        rotate([0, 0, 60])
            cube([30/2, 5, 10]);
    //translate([-5, ((38+0)/2), -9])
        //rotate([0, 0, 90])
            //cube([25/2, 5, 10]);
    translate([-15, ((12)/2), -9.5])//
        rotate([0, 0, 90])
            cube([36/2, 5, 10]);
    translate([-50, ((1.1)), -9.5])//
        cube([70/2, 5, 10]);
    translate([-49.5, ((2.25)/2), -9.5])//
        rotate([0, 0, 90])
            cube([(46/2)+10, 5, 10]);
    translate([-50, 58.29/2, -9.5])//
        cube([40/2, 5, 10]);
    translate([-10.5, ((11.7)/2), -9.5])//
        rotate([0, 0, 90])
            cube([12.9, 1.55, 10]);
    translate([-16.5, ((11.7)/2), -9.5])//
        rotate([0, 0, 0])
            cube([5, 1.55, 10]);
    translate([-16.5, ((34.45)/2), -9.5])//
        rotate([0, 0, 0])
            cube([5, 1.55, 10]);




}


}

////handle
//translate([0,length,0]) {
//    difference() {
//        difference() {
//            cylinder(h=2, r=10);
//            cylinder(h=2, r=5);
//
//        }
//        translate([0,-10,0]) {
//            cube(size=[10,10,2]);        
//        }
//    }
//}


module roundedBox(length, width, height, radius)
{
    dRadius = 2*radius;

    //cube bottom right
    translate([width-dRadius,-radius,0]) {
        cube(size=[radius,radius,height+0.01]);
    }

    //cube top left
    translate([-radius,length-dRadius,0]) {
        cube(size=[radius,radius,height+0.01]);
    }

    //base rounded shape
    minkowski() {
        cube(size=[width-dRadius,length-dRadius, height]);
        cylinder(r=radius, h=0.01);
    }
  
    
  
}


