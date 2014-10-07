
epsilon = 0.001;
a = [0 - epsilon, 41/2];
b = [22.5/2, 41/2];
c = [33/2, 0];
d = [22.5/2, -41/2];
e = [0 - epsilon, -41/2];

rotate([0,0,-90]) rotate([90,0,0]) panel();

module panel() {
	/* basic panel */
	translate([0,0,-0.25]) linear_extrude(height=0.5) {
		polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
		mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
	}

	render() difference() {
		translate([0,0,-0.65]) scale([(33-0.5)/33, (41-0.5)/41,1])
		linear_extrude(height=1.3) {
			polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
			mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
		}
		translate([0,0,0.25]) scale([(33 - 1.5)/ 33, (41 - 1.3)/41, 1])
		linear_extrude(height=0.5) {
			polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
			mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
		}
		translate([0,0,-0.75]) scale([(33 - 1.5)/ 33, (41 - 1.3)/41, 1])
		linear_extrude(height=0.5) {
			polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
			mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
		}
	}

	/* center piece */
	cylinder($fn=6,r=4,h=1.2, center=true);
	cylinder($fn=6,r=3,h=2.0, center=true);
	difference() {
		cylinder($fn=20,r=1.4,h=2.8,center=true);
		translate([0,0,1.4]) cylinder($fn=20,r=1.0,h=0.3+epsilon,center=true);
	}

	/* spines */
	spines();
	mirror([0,0,1]) spines();
}

module spines() {
	diagSpine();
	mirror([1,0,0]) diagSpine();
	mirror([0,1,0]) diagSpine();
	mirror([1,0,0]) mirror([0,1,0]) diagSpine();

	mirror([1,0,0]) hull() {
		translate([33/2-0.4,0,0.5]) sphere(r=0.3);
		translate([0,0,0.5]) sphere(r=0.3);
	}
	hull() {
		translate([33/2-0.4,0,0.5]) sphere(r=0.3);
		translate([0,0,0.5]) sphere(r=0.3);
	}
}

module diagSpine() {
	hull() {
		translate([22.5/2-0.4, 41/2-0.5,0.5]) sphere(r=0.3);
		translate([0,0,0.5]) sphere(r=0.3);
	}
}
