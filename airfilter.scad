
inch = 25.4;

fx = 15.5;
fy = 19.5;
fz = 0.75;
ds = 0.375; // dowel size 3/8 inch
dl = 1.5;   // dowel length 1.5 inches
hyl = 4.6666;    // (19.5 - (2 * .75)) / 3
hxl = 7;    // (15.5 - (2 * .75)) / 3  

module filter()
{
// 15.5 x 19.5 x 0.75
 cube([fx * inch,fy * inch,fz * inch]);

}

module corner()
{
    difference(){
        cube([(fz+.75)*inch,(fz+.75)*inch,(fz+.75)*inch]);
        translate([-.1,.75 * inch+.1,-.1]) cube([fz * inch, fz * inch, fz * inch]);
        translate([(fz)*inch+.1,-.1,-.1]) cube([fz * inch, fz * inch, fz * inch]);
        translate([fz/2*inch,fz/2*inch,-.1]) cylinder(r=((ds*inch)+2)/2,h=((dl*inch)+2)/2);
        translate([((fz+(fz/2))*inch),((fz+(fz/2))*inch),-.1]) cylinder(r=((ds*inch)+2)/2,h=((dl*inch)+2)/2);
        translate([((fz + (fz/2)))*inch,dl/2*inch,((.5 * fz) + fz)*inch]) rotate([90,90,0]) cylinder(r=((ds*inch)+2)/2,h=((dl*inch)+2)/2);
        translate([-.1,(fz+fz/2)*inch,((.5 * fz) + fz)*inch]) rotate([0,90,0]) cylinder(r=((ds*inch)+2)/2,h=((dl*inch)+2)/2);
        
        translate([fz/2*inch,fz/2*inch,((fz+.75)/2)*inch]) cylinder(r=3.4/2,h=((dl*inch)+2)/2,$fn=128);
        translate([((fz+(fz/2))*inch),((fz+(fz/2))*inch),((fz+.75)/2)*inch]) cylinder(r=3.4/2,h=((dl*inch)+2)/2,$fn=128);
        
        translate([fz/2*inch,fz/2*inch,((fz+.75)/2)*inch]) cylinder(r=5.5/2,h=6,$fn=5);
        translate([((fz+(fz/2))*inch),((fz+(fz/2))*inch),((fz+.75)/2)*inch]) cylinder(r=5.5/2,h=6,$fn=5);
       
        }
}

//corner();
module ypart()
{
  difference(){
         cube([hyl*inch,(fz+.75)*inch,(fz+.75)*inch]);
         translate([-1,.75*inch+.1,-.1]) cube([(hyl * inch)+2, fz * inch, fz * inch]);
         translate([-.1,(fz+fz/2)*inch,((.5 * fz) + fz)*inch]) rotate([0,90,0]) cylinder(r=((ds*inch)+2)/2,h=(hyl * inch)+2);
         
         
         }
}

module xpart()
{
  difference(){
         cube([hxl*inch,(fz+.75)*inch,(fz+.75)*inch]);
         translate([-1,.75*inch+.1,-.1]) cube([(hxl * inch)+2, fz * inch, fz * inch]);
         translate([-.1,(fz+fz/2)*inch,((.5 * fz) + fz)*inch]) rotate([0,90,0]) cylinder(r=((ds*inch)+2)/2,h=(hxl * inch)+2);
         
         
         }
}

translate([(0-(2*fz))*inch,0,0]) rotate([0,0,90]) corner();
ypart();
translate([ 0, 0-(3*fz) * inch,0]) xpart();

