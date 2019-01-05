
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

// poly_path4274(1);
// poly_path4042(1);
// poly_path3450(1);
// poly_path3398(1);
// poly_path4446(1);
// poly_path3402(1);
// poly_path4082(1);
// poly_path3890(1);
// poly_path4542(1);
// poly_path3410(1);
// poly_path4350(1);
// poly_path3918(1);
// poly_path3802(1);
// poly_path4378(1);
// poly_path4126(1);
// poly_path3426(1);
// poly_path4394(1);
// poly_path3806(1);
// poly_path4282(1);
// poly_path3610(1);
// poly_path3994(1);
// poly_path4726(1); // screw hole
// poly_path4454(1);
// poly_path3430(1);
// poly_path4598(1);
// poly_path4090(1);
// poly_path4046(1);
// poly_path3502(1);
// poly_path4018(1);
// poly_path4438(1);
// poly_path3498(1);
// poly_path4386(1);
// poly_path3506(1);
// poly_path4502(1);
// poly_path4022(1);
// poly_path3818(1);
// poly_path3574(1);
// poly_path3762(1);
// poly_path4194(1);
// poly_path4074(1);
// poly_path4002(1);
// poly_path4434(1);
// poly_path3822(1);
// poly_path4098(1);
// poly_path3422(1);
// poly_path3906(1);
// poly_path4558(1);
// poly_path3510(1);
// poly_path3934(1);
// poly_path4714(1);
// poly_path3978(1);
// poly_path4030(1);
// poly_path3830(1);
// poly_path4586(1);
// poly_path3614(1);
// poly_path4490(1);
// poly_path4298(1);
// poly_path3494(1);
// poly_path4202(1);
// poly_path4374(1);
// poly_path4010(1);
// poly_path3834(1);
// poly_path4342(1);
// poly_path4106(1);
// poly_path4662(1);
// poly_path4670(1);
// poly_path3838(1);
// poly_path4134(1);
// poly_path3942(1);
// poly_path4290(1); // stopped passing through here.
// poly_path3434(1);
// poly_path4402(1);
// poly_path3842(1);
// poly_path3690(1);
// poly_path3766(1);
// poly_path4498(1);
// poly_path3514(1);
// poly_path3774(1);
// poly_path4210(1);
// poly_path4286(1);
// poly_path3490(1);
// poly_path4190(1);
// poly_path4522(1);
// poly_path4114(1);
// poly_path3850(1);
// poly_path4574(1);
// poly_path4142(1);
// poly_path4606(1);
// poly_path3950(1);
// poly_path4410(1);
// poly_path3518(1);
// poly_path4546(1);
// poly_path3462(1);
// poly_path4602(1);
// poly_path3454(1);
// poly_path3758(1);
// poly_path4314(1);
// poly_path3522(1);
// poly_path3898(1);
// poly_path3526(1);
// poly_path4678(1);
// poly_path4246(1);
// poly_path4150(1);
// poly_path3958(1);
// poly_path4178(1);
// poly_path3530(1);
// poly_path3694(1);
// poly_path3482(1);
// poly_path4054(1);
// poly_path3986(1);
// poly_path3862(1);
// poly_path4514(1);
// poly_path3982(1);
// poly_path3534(1);
// poly_path4226(1);
// poly_path4418(1);
// poly_path3442(1);
// poly_path4734(1);
// poly_path3538(1);
// poly_path4130(1);
// poly_path4686(1);
// poly_path4254(1);
// poly_path4158(1);
// poly_path4038(1);
// poly_path3966(1);
// poly_path3542(1);
// poly_path3622(1);
// poly_path3486(1);
// poly_path4062(1);
// poly_path4618(1);
// poly_path3870(1);
// poly_path3546(1);
// poly_path4330(1);
// poly_path4234(1);
// poly_path3418(1);
// poly_path4358(1);
// poly_path4594(1);
// poly_path3406(1);
// poly_path3974(1);
// poly_path4262(1);
// poly_path4166(1);
// poly_path4306(1);
// poly_path3554(1);
// poly_path3586(1);
// poly_path3550(1);
// poly_path4722(1);
// poly_path3446(1);
// poly_path4638(1);
// poly_path4070(1);
// poly_path3558(1);
// poly_path4530(1);
// poly_path4338(1);
// poly_path4242(1);
// poly_path3466(1);
// poly_path4366(1);
// poly_path3562(1);
// poly_path4610(1);
// poly_path3738(1);
// poly_path3810(1);
// poly_path4690(1);
// poly_path4270(1);
// poly_path4154(1);
// poly_path3566(1);
// poly_path4730(1);
// poly_path3474(1);
// poly_path4442(1);
// poly_path3618(1);
// poly_path3878(1);
// poly_path3570(1);
// poly_path4634(1);
// poly_path3886(1);
// poly_path4538(1);
// poly_path4294(1);
// poly_path4346(1);
// poly_path3914(1);
// poly_path4198(1);
// poly_path3458(1);
// poly_path4626(1);
// poly_path3686(1);
// poly_path4470(1);
// poly_path4278(1);
// poly_path3394(1);
// poly_path3778(1);
// poly_path3578(1);
// poly_path4450(1);
// poly_path4086(1);
// poly_path4642(1); // started here
// poly_path3582(1);
// poly_path4354(1);
// poly_path4058(1);
// poly_path3922(1);
// poly_path4382(1);
// poly_path4474(1);
// poly_path3698(1);
// poly_path4486(1);
// poly_path3826(1);
// poly_path3742(1);
// poly_path3414(1);
// poly_path3590(1);
// poly_path3998(1);
// poly_path4102(1);
// poly_path4458(1);
// poly_path4518(1);
// poly_path4094(1);
// poly_path3594(1);
// poly_path3902(1);
// poly_path4554(1);
// poly_path3930(1);
// poly_path4390(1);
// poly_path3710(1);
// poly_path4702(1);
// poly_path4026(1);
// poly_path4582(1);
// poly_path3706(1);
// poly_path3782(1);
// poly_path3602(1);
// poly_path4006(1);
// poly_path4466(1);
// poly_path4650(1);
// poly_path3606(1);
// poly_path3854(1);
// poly_path4658(1);
// poly_path4562(1);
// poly_path4534(1);
// poly_path3938(1);
// poly_path3722(1);
// poly_path4398(1);
// poly_path4506(1);
// poly_path4034(1);
// poly_path4590(1);
// poly_path3746(1);
// poly_path3726(1);
// poly_path4302(1);
// poly_path4206(1);
// poly_path4014(1);
// poly_path4646(1);
// poly_path4218(1);
// poly_path3730(1);
// poly_path4550(1);
// poly_path4110(1);
// poly_path4666(1);
// poly_path3470(1);
// poly_path4138(1);
// poly_path3946(1);
// poly_path3734(1);
// poly_path4406(1);
// poly_path3926(1);
// poly_path3598(1);
// poly_path3438(1);
// poly_path3626(1);
// poly_path3754(1);
// poly_path4310(1);
// poly_path4214(1);
// poly_path4426(1);
// poly_path4494(1);
// poly_path4078(1);
// poly_path3630(1);
// poly_path4710(1);
// poly_path4322(1);
// poly_path3846(1);
// poly_path4118(1);
// poly_path4674(1);
// poly_path4578(1);
// poly_path4146(1);
// poly_path3634(1);
// poly_path3954(1);
// poly_path4414(1);
// poly_path3750(1);
// poly_path4050(1);
// poly_path3638(1);
// poly_path3858(1);
// poly_path4510(1);
// poly_path4318(1);
// poly_path4222(1);
// poly_path4430(1);
// poly_path4186(1);
// poly_path3642(1);
// poly_path4122(1);
// poly_path4682(1);
// poly_path4250(1);
// poly_path3646(1);
// poly_path4698(1);
// poly_path3962(1);
// poly_path4422(1);
// poly_path3714(1);
// poly_path4174(1);
// poly_path3790(1);
// poly_path3650(1);
// poly_path4614(1);
// poly_path3866(1);
// poly_path3770(1);
// poly_path4326(1);
// poly_path3894(1);
// poly_path4230(1);
// poly_path3654(1);
// poly_path4478(1);
// poly_path4706(1);
// poly_path4622(1);
// poly_path3798(1);
// poly_path3702(1);
// poly_path3658(1);
// poly_path4258(1);
// poly_path4162(1);
// poly_path4718(1);
// poly_path3970(1);
// poly_path3478(1);
// poly_path3662(1);
// poly_path4066(1);
// poly_path3874(1);
// poly_path4526(1);
// poly_path4570(1);
// poly_path4334(1);
// poly_path4238(1);
// poly_path3666(1);
// poly_path4462(1);
// poly_path4362(1);
// poly_path4566(1);
// poly_path3670(1);
// poly_path4266(1);
// poly_path4170(1);
// poly_path4182(1);
// poly_path3718(1);
// poly_path4694(1);
// poly_path3794(1);
// poly_path3674(1);
// poly_path3990(1);
// poly_path4630(1);
// poly_path3882(1);
// poly_path3786(1);
// poly_path3678(1);
// poly_path3910(1);
// poly_path4370(1);
// poly_path4482(1);
// poly_path4654(1);
// poly_path3682(1);
// poly_path3814(1);

module poly_path4274(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,26.406125],[102.276250,23.751125]]);
  }
}

module poly_path4042(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-176.093875],[-32.724000,-176.093875]]);
  }
}

module poly_path3450(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-47.510750,146.637125],[-50.877000,146.637125]]);
  }
}

module poly_path3398(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-72.737875],[-13.760750,-70.082875]]);
  }
}

module poly_path4446(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,22.734125],[121.238750,22.734125]]);
  }
}

module poly_path3402(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-72.737875],[-17.127000,-72.737875]]);
  }
}

module poly_path4082(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-187.181875],[-13.760750,-184.526875]]);
  }
}

module poly_path3890(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-111.248875],[-81.260750,-108.593875]]);
  }
}

module poly_path4542(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-129.140875],[102.276750,-129.140875]]);
  }
}

module poly_path3410(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-119.681875],[-13.760750,-117.026875]]);
  }
}

module poly_path4350(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,90.234125],[121.238750,90.234125]]);
  }
}

module poly_path3918(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-61.640875],[-81.261250,-61.640875]]);
  }
}

module poly_path3802(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-24.218875],[237.276000,-24.218875]]);
  }
}

module poly_path4378(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-41.093875],[53.739500,-41.093875]]);
  }
}

module poly_path4126(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-159.218875],[185.373000,-159.218875]]);
  }
}

module poly_path3426(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-72.737875],[34.776250,-70.082875]]);
  }
}

module poly_path4394(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,3.204125],[50.373250,-41.093375]]);
  }
}

module poly_path3806(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,20.079125],[237.276000,20.079125]]);
  }
}

module poly_path4282(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,26.406125],[53.739500,26.406125]]);
  }
}

module poly_path3610(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,43.281125],[237.276000,43.281125]]);
  }
}

module poly_path3994(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-167.651875],[-148.760500,-167.651875]]);
  }
}

module poly_path4726(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-90.737750,15.131125],[-89.220680,15.437414],[-87.981812,16.272687],[-87.146539,17.511555],[-86.840250,19.028625],[-87.146539,20.545695],[-87.981812,21.784562],[-89.220680,22.619836],[-90.737750,22.926125],[-92.254820,22.619836],[-93.493688,21.784562],[-94.328961,20.545695],[-94.635250,19.028625],[-94.328961,17.511555],[-93.493688,16.272687],[-92.254820,15.437414],[-90.737750,15.131125]]);
  }
}

module poly_path4454(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-61.640875],[102.276250,-64.295875]]);
  }
}

module poly_path3430(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-17.126750,-117.026875],[-17.126750,-72.738125]]);
  }
}

module poly_path4598(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-47.420875],[121.239250,-44.765875]]);
  }
}

module poly_path4090(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-184.526875],[34.776000,-184.526875]]);
  }
}

module poly_path4046(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-131.795875],[-32.724000,-131.795875]]);
  }
}

module poly_path3502(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,26.406125],[-84.627000,26.406125]]);
  }
}

module poly_path4018(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-170.306875],[-100.223250,-170.306875]]);
  }
}

module poly_path4438(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[117.873250,-24.218875],[117.873250,20.078625]]);
  }
}

module poly_path3498(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,70.704125],[-84.627000,70.704125]]);
  }
}

module poly_path4386(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,5.859125],[53.739250,3.204125]]);
  }
}

module poly_path3506(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,23.751125],[-81.260750,26.406125]]);
  }
}

module poly_path4502(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-129.140875],[102.276250,-131.795875]]);
  }
}

module poly_path4022(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-131.795875],[-81.260750,-129.140875]]);
  }
}

module poly_path3818(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-24.218875],[240.642250,20.078625]]);
  }
}

module poly_path3574(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-17.126750,17.973125],[-17.126750,62.261875]]);
  }
}

module poly_path3762(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-5.237875],[34.776250,-2.582875]]);
  }
}

module poly_path4194(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-66.473750,155.079125],[-66.473750,157.734125]]);
  }
}

module poly_path4074(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-140.237875],[-17.127000,-140.237875]]);
  }
}

module poly_path4002(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-120.707875],[-148.760750,-123.362875]]);
  }
}

module poly_path4434(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,20.079125],[169.776250,22.734125]]);
  }
}

module poly_path3822(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,22.734125],[188.738750,22.734125]]);
  }
}

module poly_path4098(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-140.237875],[34.776250,-137.582875]]);
  }
}

module poly_path3422(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-72.737875],[34.776000,-72.737875]]);
  }
}

module poly_path3906(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-64.295875],[-32.723750,-61.640875]]);
  }
}

module poly_path4558(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-159.218875],[117.873000,-159.218875]]);
  }
}

module poly_path3510(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,23.751125],[-32.723750,26.406125]]);
  }
}

module poly_path3934(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-91.718875],[185.373000,-91.718875]]);
  }
}

module poly_path4714(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-180.773750,88.092125],[-177.966250,86.472125]]);
  }
}

module poly_path3978(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-123.362875],[-96.857500,-123.362875]]);
  }
}

module poly_path4030(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-176.093875],[-84.627000,-176.093875]]);
  }
}

module poly_path3830(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-53.207875],[-100.223750,-55.862875]]);
  }
}

module poly_path4586(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-159.218875],[173.142250,-114.921375]]);
  }
}

module poly_path3614(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,87.579125],[237.276000,87.579125]]);
  }
}

module poly_path4490(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-64.295875],[50.373250,-108.593375]]);
  }
}

module poly_path4298(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,70.704125],[50.373250,26.406625]]);
  }
}

module poly_path3494(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,70.704125],[-81.260750,73.359125]]);
  }
}

module poly_path4202(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-63.107750,110.781125],[-63.107750,155.078625]]);
  }
}

module poly_path4374(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-41.093875],[53.739250,-43.748875]]);
  }
}

module poly_path4010(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-123.362875],[-152.126750,-167.651625]]);
  }
}

module poly_path3834(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-55.862875],[-96.857500,-55.862875]]);
  }
}

module poly_path4342(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[117.873250,43.281125],[117.873250,87.578625]]);
  }
}

module poly_path4106(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-184.526875],[38.142250,-140.238125]]);
  }
}

module poly_path4662(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-233.423750,90.837125],[-195.075000,68.697125]]);
  }
}

module poly_path4670(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-172.043750,197.163125],[-133.686250,175.023125]]);
  }
}

module poly_path3838(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-100.151875],[-96.857500,-100.151875]]);
  }
}

module poly_path4134(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-161.873875],[237.276250,-159.218875]]);
  }
}

module poly_path3942(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-94.373875],[237.276250,-91.718875]]);
  }
}

module poly_path4290(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,73.359125],[53.739250,70.704125]]);
  }
}

module poly_path3434(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-117.026875],[38.142250,-72.738125]]);
  }
}

module poly_path4402(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-43.748875],[102.276750,-43.748875]]);
  }
}

module poly_path3842(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-100.151875],[-100.223750,-102.806875]]);
  }
}

module poly_path3690(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,3.204125],[-84.627000,3.204125]]);
  }
}

module poly_path3766(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-17.126750,-49.526875],[-17.126750,-5.238125]]);
  }
}

module poly_path4498(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-111.248875],[102.276750,-111.248875]]);
  }
}

module poly_path3514(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,26.406125],[-32.724000,26.406125]]);
  }
}

module poly_path3774(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-2.582875],[-13.761250,-2.582875]]);
  }
}

module poly_path4210(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-66.473750,108.126125],[-115.011250,108.126125]]);
  }
}

module poly_path4286(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,70.704125],[53.739500,70.704125]]);
  }
}

module poly_path3490(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[1.026250,99.693125],[-47.511250,99.693125]]);
  }
}

module poly_path4190(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-63.107750,155.079125],[-66.474000,155.079125]]);
  }
}

module poly_path4522(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-176.093875],[53.739500,-176.093875]]);
  }
}

module poly_path4114(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-187.181875],[-13.761250,-187.181875]]);
  }
}

module poly_path3850(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-100.151875],[-148.760500,-100.151875]]);
  }
}

module poly_path4574(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-114.920875],[169.776000,-114.920875]]);
  }
}

module poly_path4142(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-114.920875],[237.276000,-114.920875]]);
  }
}

module poly_path4606(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-91.718875],[117.873000,-91.718875]]);
  }
}

module poly_path3950(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-47.420875],[237.276000,-47.420875]]);
  }
}

module poly_path4410(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,20.079125],[117.873000,20.079125]]);
  }
}

module poly_path3518(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,70.704125],[-32.724000,70.704125]]);
  }
}

module poly_path4546(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-178.748875],[102.276750,-178.748875]]);
  }
}

module poly_path3462(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[1.026250,99.693125],[1.026250,102.348125]]);
  }
}

module poly_path4602(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-47.420875],[117.873000,-47.420875]]);
  }
}

module poly_path3454(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-47.510750,102.348125],[-50.877000,102.348125]]);
  }
}

module poly_path3758(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-5.237875],[34.776000,-5.237875]]);
  }
}

module poly_path4314(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,87.579125],[117.873000,87.579125]]);
  }
}

module poly_path3522(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,70.704125],[-32.723750,73.359125]]);
  }
}

module poly_path3898(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-108.593875],[-32.724000,-108.593875]]);
  }
}

module poly_path3526(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-84.626750,26.406125],[-84.626750,70.703625]]);
  }
}

module poly_path4678(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-135.368750,172.107125],[-133.065000,170.774625]]);
  }
}

module poly_path4246(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-96.857750,79.137125],[-96.857750,34.848375]]);
  }
}

module poly_path4150(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[185.373250,-159.218875],[185.373250,-114.921375]]);
  }
}

module poly_path3958(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[185.373250,-91.718875],[185.373250,-47.421375]]);
  }
}

module poly_path4178(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-115.010750,108.126125],[-115.010750,110.781125]]);
  }
}

module poly_path3530(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,26.406125],[-29.357750,70.703625]]);
  }
}

module poly_path3694(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-41.093875],[-84.627000,-41.093875]]);
  }
}

module poly_path3482(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[4.392250,102.348125],[4.392250,146.636875]]);
  }
}

module poly_path4054(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-84.626750,-176.093875],[-84.626750,-131.796375]]);
  }
}

module poly_path3986(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-167.651875],[-100.223750,-170.306875]]);
  }
}

module poly_path3862(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-96.857750,-55.862875],[-96.857750,-100.151625]]);
  }
}

module poly_path4514(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-176.093875],[102.276250,-178.748875]]);
  }
}

module poly_path3982(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-167.651875],[-96.857500,-167.651875]]);
  }
}

module poly_path3534(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,73.359125],[-81.261250,73.359125]]);
  }
}

module poly_path4226(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,34.848125],[-100.223750,32.193125]]);
  }
}

module poly_path4418(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-26.873875],[121.239250,-24.218875]]);
  }
}

module poly_path3442(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-119.681875],[-13.761250,-119.681875]]);
  }
}

module poly_path4734(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[255.456250,-170.846875],[255.456250,-170.864375],[254.952500,-173.754375],[254.916250,-173.834375],[253.448750,-176.373125],[253.395000,-176.444375],[251.145000,-178.334375],[251.063750,-178.379375],[248.310000,-179.379375],[248.283750,-179.388125],[248.247500,-179.396875],[246.807500,-179.523125],[187.758750,-194.283125],[187.748750,-194.283125],[187.740000,-194.283125],[149.768750,-200.609375],[109.692500,-206.945625],[109.683750,-206.945625],[109.673750,-206.945625],[69.597500,-211.158125],[69.588750,-211.166875],[44.280000,-213.273125],[18.972500,-215.379375],[-2.123750,-217.494375],[-2.132500,-217.494375],[-2.151250,-217.494375],[-25.352500,-217.494375],[-25.361250,-217.494375],[-25.371250,-217.494375],[-52.793750,-215.379375],[-52.802500,-215.379375],[-52.811250,-215.379375],[-67.581250,-213.273125],[-67.590000,-213.264375],[-111.887500,-204.830625],[-111.906250,-204.821875],[-111.923750,-204.821875],[-158.310000,-187.955625],[-161.171250,-187.451875],[-161.261250,-187.415625],[-163.800000,-185.949375],[-163.871250,-185.894375],[-165.752500,-183.644375],[-165.797500,-183.564375],[-166.806250,-180.809375],[-166.806250,-180.783125],[-166.815000,-180.746875],[-166.941250,-179.279375],[-166.941250,-179.270625],[-166.950000,-179.253125],[-166.941250,-10.520625],[-169.046250,8.424375],[-173.250000,23.120625],[-181.646250,33.615625],[-190.052500,42.020625],[-204.795000,52.550625],[-223.776250,65.205625],[-251.190000,82.080625],[-251.216250,82.098125],[-251.243750,82.125625],[-253.755000,84.798125],[-253.800000,84.870625],[-255.240000,88.245625],[-255.266250,88.335625],[-255.465000,91.989375],[-255.456250,92.079375],[-254.393750,95.589375],[-254.376250,95.606875],[-254.366250,95.634375],[-254.006250,96.300625],[-188.010000,213.200625],[-188.010000,213.210625],[-188.001250,213.219375],[-188.001250,213.228125],[-187.956250,213.281875],[-185.282500,215.784375],[-185.201250,215.838125],[-181.836250,217.278125],[-181.746250,217.295625],[-178.091250,217.494375],[-178.001250,217.485625],[-174.491250,216.423125],[-174.465000,216.405625],[-174.428750,216.395625],[-172.881250,215.424375],[-172.871250,215.424375],[-143.342500,198.549375],[-124.380000,188.019375],[-94.886250,177.480625],[-67.491250,171.161875],[-31.661250,166.940625],[10.512500,166.940625],[10.530000,166.940625],[10.557500,166.940625],[13.437500,166.436875],[13.527500,166.400625],[16.065000,164.934375],[16.073750,164.925625],[16.137500,164.880625],[18.018750,162.630625],[18.063750,162.549375],[19.062500,159.795625],[19.071250,159.768125],[19.080000,159.731875],[19.206250,158.265625],[19.206250,158.255625],[19.215000,158.238125],[19.215000,116.064375],[19.332500,114.650625],[20.313750,111.969375],[22.131250,109.800625],[24.588750,108.378125],[27.405000,107.883125],[246.753750,107.883125],[246.780000,107.883125],[246.807500,107.883125],[249.687500,107.370625],[249.777500,107.343125],[252.315000,105.875625],[252.323750,105.866875],[252.387500,105.813125],[254.268750,103.571875],[254.313750,103.490625],[255.312500,100.736875],[255.321250,100.700625],[255.330000,100.665625],[255.456250,99.206875],[255.456250,99.189375],[255.465000,99.180625],[255.465000,-170.819375],[255.456250,-170.846875]]);
  }
}

module poly_path3538(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,23.751125],[-81.261250,23.751125]]);
  }
}

module poly_path4130(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-161.873875],[188.739250,-159.218875]]);
  }
}

module poly_path4686(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-173.726750,194.247125],[-172.044250,197.163375]]);
  }
}

module poly_path4254(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,81.792125],[-100.223250,81.792125]]);
  }
}

module poly_path4158(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-112.265875],[188.738750,-112.265875]]);
  }
}

module poly_path4038(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-178.748875],[-32.723750,-176.093875]]);
  }
}

module poly_path3966(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-44.765875],[188.738750,-44.765875]]);
  }
}

module poly_path3542(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,62.262125],[-13.760750,64.917125]]);
  }
}

module poly_path3622(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[185.373250,43.281125],[185.373250,87.578625]]);
  }
}

module poly_path3486(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[1.026250,149.292125],[-47.511250,149.292125]]);
  }
}

module poly_path4062(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-129.140875],[-81.261250,-129.140875]]);
  }
}

module poly_path4618(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-91.718875],[169.776000,-91.718875]]);
  }
}

module poly_path3870(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-53.207875],[-100.223250,-53.207875]]);
  }
}

module poly_path3546(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,62.262125],[-17.127000,62.262125]]);
  }
}

module poly_path4330(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,43.281125],[169.776000,43.281125]]);
  }
}

module poly_path4234(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,34.848125],[-148.760500,34.848125]]);
  }
}

module poly_path3418(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-117.026875],[34.776000,-117.026875]]);
  }
}

module poly_path4358(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,5.859125],[102.276250,3.204125]]);
  }
}

module poly_path4594(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-161.873875],[121.238750,-161.873875]]);
  }
}

module poly_path3406(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-117.026875],[-17.127000,-117.026875]]);
  }
}

module poly_path3974(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-120.707875],[-100.223750,-123.362875]]);
  }
}

module poly_path4262(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,73.359125],[102.276250,70.704125]]);
  }
}

module poly_path4166(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-115.010750,155.079125],[-115.010750,157.734125]]);
  }
}

module poly_path4306(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,23.751125],[102.276750,23.751125]]);
  }
}

module poly_path3554(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,15.318125],[-13.760750,17.973125]]);
  }
}

module poly_path3586(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,15.318125],[-13.761250,15.318125]]);
  }
}

module poly_path3550(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,17.973125],[-17.127000,17.973125]]);
  }
}

module poly_path4722(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-90.737750,-119.868875],[-89.220680,-119.562586],[-87.981812,-118.727312],[-87.146539,-117.488445],[-86.840250,-115.971375],[-87.146539,-114.454305],[-87.981812,-113.215438],[-89.220680,-112.380164],[-90.737750,-112.073875],[-92.254820,-112.380164],[-93.493688,-113.215438],[-94.328961,-114.454305],[-94.635250,-115.971375],[-94.328961,-117.488445],[-93.493688,-118.727312],[-92.254820,-119.562586],[-90.737750,-119.868875]]);
  }
}

module poly_path3446(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-47.510750,146.637125],[-47.510750,149.292125]]);
  }
}

module poly_path4638(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-44.765875],[121.238750,-44.765875]]);
  }
}

module poly_path4070(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-140.237875],[-13.760750,-137.582875]]);
  }
}

module poly_path3558(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,15.318125],[34.776250,17.973125]]);
  }
}

module poly_path4530(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-129.140875],[53.739250,-131.795875]]);
  }
}

module poly_path4338(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,87.579125],[169.776250,90.234125]]);
  }
}

module poly_path4242(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,81.792125],[-148.760750,79.137125]]);
  }
}

module poly_path3466(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[4.392250,102.348125],[1.026000,102.348125]]);
  }
}

module poly_path4366(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-41.093875],[105.642500,-41.093875]]);
  }
}

module poly_path3562(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,17.973125],[34.776000,17.973125]]);
  }
}

module poly_path4610(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-94.373875],[121.239250,-91.718875]]);
  }
}

module poly_path3738(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-5.237875],[-17.127000,-5.237875]]);
  }
}

module poly_path3810(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,20.079125],[237.276250,22.734125]]);
  }
}

module poly_path4690(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-234.044750,95.085125],[-176.022250,195.578875]]);
  }
}

module poly_path4270(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,26.406125],[105.642500,26.406125]]);
  }
}

module poly_path4154(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-159.218875],[240.642250,-114.921375]]);
  }
}

module poly_path3566(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,62.262125],[34.776000,62.262125]]);
  }
}

module poly_path4730(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[179.262250,27.787000],[180.779320,28.093289],[182.018188,28.928562],[182.853461,30.167430],[183.159750,31.684500],[182.853461,33.201570],[182.018188,34.440437],[180.779320,35.275711],[179.262250,35.582000],[177.745180,35.275711],[176.506312,34.440437],[175.671039,33.201570],[175.364750,31.684500],[175.671039,30.167430],[176.506312,28.928562],[177.745180,28.093289],[179.262250,27.787000]]);
  }
}

module poly_path3474(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[1.026250,146.637125],[1.026250,149.292125]]);
  }
}

module poly_path4442(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-24.218875],[173.142250,20.078625]]);
  }
}

module poly_path3618(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,87.579125],[237.276250,90.234125]]);
  }
}

module poly_path3878(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-64.295875],[-81.260750,-61.640875]]);
  }
}

module poly_path3570(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,62.262125],[34.776250,64.917125]]);
  }
}

module poly_path4634(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-91.718875],[173.142250,-47.421375]]);
  }
}

module poly_path3886(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-108.593875],[-84.627000,-108.593875]]);
  }
}

module poly_path4538(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-131.795875],[50.373250,-176.093375]]);
  }
}

module poly_path4294(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[105.642250,70.704125],[105.642250,26.406625]]);
  }
}

module poly_path4346(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,43.281125],[173.142250,87.578625]]);
  }
}

module poly_path3914(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-108.593875],[-29.357750,-64.296375]]);
  }
}

module poly_path4198(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-118.376750,110.781125],[-118.376750,155.078625]]);
  }
}

module poly_path3458(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-47.510750,99.693125],[-47.510750,102.348125]]);
  }
}

module poly_path4626(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-47.420875],[169.776250,-44.765875]]);
  }
}

module poly_path3686(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,3.204125],[-81.260750,5.859125]]);
  }
}

module poly_path4470(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-108.593875],[53.739250,-111.248875]]);
  }
}

module poly_path4278(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,26.406125],[53.739250,23.751125]]);
  }
}

module poly_path3394(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-149.800250,110.051500],[-148.283180,110.357789],[-147.044313,111.193062],[-146.209039,112.431930],[-145.902750,113.949000],[-146.209039,115.466070],[-147.044313,116.704937],[-148.283180,117.540211],[-149.800250,117.846500],[-151.317320,117.540211],[-152.556187,116.704937],[-153.391461,115.466070],[-153.697750,113.949000],[-153.391461,112.431930],[-152.556187,111.193062],[-151.317320,110.357789],[-149.800250,110.051500]]);
  }
}

module poly_path3778(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-52.181875],[-13.761250,-52.181875]]);
  }
}

module poly_path3578(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,17.973125],[38.142250,62.261875]]);
  }
}

module poly_path4450(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-26.873875],[121.238750,-26.873875]]);
  }
}

module poly_path4086(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-187.181875],[34.776250,-184.526875]]);
  }
}

module poly_path4642(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-94.373875],[121.238750,-94.373875]]);
  }
}

module poly_path3582(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,64.917125],[-13.761250,64.917125]]);
  }
}

module poly_path4354(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,40.626125],[121.238750,40.626125]]);
  }
}

module poly_path4058(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-176.093875],[-29.357750,-131.796375]]);
  }
}

module poly_path3922(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-111.248875],[-81.261250,-111.248875]]);
  }
}

module poly_path4382(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,3.204125],[53.739500,3.204125]]);
  }
}

module poly_path4474(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-108.593875],[53.739500,-108.593875]]);
  }
}

module poly_path3698(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-43.748875],[-81.260750,-41.093875]]);
  }
}

module poly_path4486(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[105.642250,-64.295875],[105.642250,-108.593375]]);
  }
}

module poly_path3826(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-26.873875],[188.738750,-26.873875]]);
  }
}

module poly_path3742(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-49.526875],[-17.127000,-49.526875]]);
  }
}

module poly_path3414(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-119.681875],[34.776250,-117.026875]]);
  }
}

module poly_path3590(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,87.579125],[188.739250,90.234125]]);
  }
}

module poly_path3998(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-123.362875],[-148.760500,-123.362875]]);
  }
}

module poly_path4102(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-17.126750,-184.526875],[-17.126750,-140.238125]]);
  }
}

module poly_path4458(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-64.295875],[105.642500,-64.295875]]);
  }
}

module poly_path4518(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-176.093875],[53.739250,-178.748875]]);
  }
}

module poly_path4094(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-140.237875],[34.776000,-140.237875]]);
  }
}

module poly_path3594(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,87.579125],[185.373000,87.579125]]);
  }
}

module poly_path3902(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-64.295875],[-32.724000,-64.295875]]);
  }
}

module poly_path4554(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-114.920875],[117.873000,-114.920875]]);
  }
}

module poly_path3930(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-47.420875],[185.373000,-47.420875]]);
  }
}

module poly_path4390(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[105.642250,3.204125],[105.642250,-41.093375]]);
  }
}

module poly_path3710(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,3.204125],[-32.724000,3.204125]]);
  }
}

module poly_path4702(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-193.391750,71.613125],[-191.088000,70.280625]]);
  }
}

module poly_path4026(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-131.795875],[-84.627000,-131.795875]]);
  }
}

module poly_path4582(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[117.873250,-159.218875],[117.873250,-114.921375]]);
  }
}

module poly_path3706(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-41.093875],[-32.724000,-41.093875]]);
  }
}

module poly_path3782(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,20.079125],[188.739250,22.734125]]);
  }
}

module poly_path3602(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,40.626125],[188.739250,43.281125]]);
  }
}

module poly_path4006(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-96.857750,-123.362875],[-96.857750,-167.651625]]);
  }
}

module poly_path4466(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-108.593875],[102.276250,-111.248875]]);
  }
}

module poly_path4650(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-233.423750,90.837125],[-231.741250,93.753375]]);
  }
}

module poly_path3606(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,40.626125],[237.276250,43.281125]]);
  }
}

module poly_path3854(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-55.862875],[-148.760500,-55.862875]]);
  }
}

module poly_path4658(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-138.473750,161.352125],[-135.666250,159.732125]]);
  }
}

module poly_path4562(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-161.873875],[121.239250,-159.218875]]);
  }
}

module poly_path4534(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[105.642250,-131.795875],[105.642250,-176.093375]]);
  }
}

module poly_path3938(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-94.373875],[188.739250,-91.718875]]);
  }
}

module poly_path3722(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-29.357750,-41.093875],[-29.357750,3.203625]]);
  }
}

module poly_path4398(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,5.859125],[102.276750,5.859125]]);
  }
}

module poly_path4506(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-131.795875],[105.642500,-131.795875]]);
  }
}

module poly_path4034(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-178.748875],[-81.260750,-176.093875]]);
  }
}

module poly_path4590(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-112.265875],[121.238750,-112.265875]]);
  }
}

module poly_path3746(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-52.181875],[-13.760750,-49.526875]]);
  }
}

module poly_path3726(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,5.859125],[-81.261250,5.859125]]);
  }
}

module poly_path4302(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,73.359125],[102.276750,73.359125]]);
  }
}

module poly_path4206(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-66.473750,157.734125],[-115.011250,157.734125]]);
  }
}

module poly_path4014(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-120.707875],[-100.223250,-120.707875]]);
  }
}

module poly_path4646(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-234.044750,95.085125],[-231.741000,93.752625]]);
  }
}

module poly_path4218(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,79.137125],[-96.857500,79.137125]]);
  }
}

module poly_path3730(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-43.748875],[-81.261250,-43.748875]]);
  }
}

module poly_path4550(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-114.920875],[121.239250,-112.265875]]);
  }
}

module poly_path4110(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-137.582875],[-13.761250,-137.582875]]);
  }
}

module poly_path4666(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-191.087750,70.281125],[-133.065250,170.774875]]);
  }
}

module poly_path3470(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[4.392250,146.637125],[1.026000,146.637125]]);
  }
}

module poly_path4138(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-159.218875],[237.276000,-159.218875]]);
  }
}

module poly_path3946(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-91.718875],[237.276000,-91.718875]]);
  }
}

module poly_path3734(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-5.237875],[-13.760750,-2.582875]]);
  }
}

module poly_path4406(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,20.079125],[121.239250,22.734125]]);
  }
}

module poly_path3926(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-47.420875],[188.739250,-44.765875]]);
  }
}

module poly_path3598(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,43.281125],[185.373000,43.281125]]);
  }
}

module poly_path3438(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-70.082875],[-13.761250,-70.082875]]);
  }
}

module poly_path3626(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,43.281125],[240.642250,87.578625]]);
  }
}

module poly_path3754(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-49.526875],[34.776000,-49.526875]]);
  }
}

module poly_path4310(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,87.579125],[121.239250,90.234125]]);
  }
}

module poly_path4214(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,81.792125],[-100.223750,79.137125]]);
  }
}

module poly_path4426(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-24.218875],[169.776000,-24.218875]]);
  }
}

module poly_path4494(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-61.640875],[102.276750,-61.640875]]);
  }
}

module poly_path4078(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-13.760750,-184.526875],[-17.127000,-184.526875]]);
  }
}

module poly_path3630(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,90.234125],[188.738750,90.234125]]);
  }
}

module poly_path4710(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-185.633750,79.677125],[-182.826250,78.057125]]);
  }
}

module poly_path4322(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,40.626125],[121.239250,43.281125]]);
  }
}

module poly_path3846(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-100.151875],[-148.760750,-102.806875]]);
  }
}

module poly_path4118(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-114.920875],[188.739250,-112.265875]]);
  }
}

module poly_path4674(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-176.021750,195.579125],[-173.726750,194.246625]]);
  }
}

module poly_path4578(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-114.920875],[169.776250,-112.265875]]);
  }
}

module poly_path4146(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-114.920875],[237.276250,-112.265875]]);
  }
}

module poly_path3634(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,40.626125],[188.738750,40.626125]]);
  }
}

module poly_path3954(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-47.420875],[237.276250,-44.765875]]);
  }
}

module poly_path4414(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,-24.218875],[117.873000,-24.218875]]);
  }
}

module poly_path3750(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[34.776250,-52.181875],[34.776250,-49.526875]]);
  }
}

module poly_path4050(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-131.795875],[-32.723750,-129.140875]]);
  }
}

module poly_path3638(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,14.292125],[-100.223750,11.637125]]);
  }
}

module poly_path3858(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-53.207875],[-148.760750,-55.862875]]);
  }
}

module poly_path4510(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-176.093875],[105.642500,-176.093875]]);
  }
}

module poly_path4318(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[121.239250,43.281125],[117.873000,43.281125]]);
  }
}

module poly_path4222(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,34.848125],[-96.857500,34.848125]]);
  }
}

module poly_path4430(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,20.079125],[169.776000,20.079125]]);
  }
}

module poly_path4186(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-63.107750,110.781125],[-66.474000,110.781125]]);
  }
}

module poly_path3642(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,11.637125],[-96.857500,11.637125]]);
  }
}

module poly_path4122(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-114.920875],[185.373000,-114.920875]]);
  }
}

module poly_path4682(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-135.368750,172.107125],[-133.686250,175.023375]]);
  }
}

module poly_path4250(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,79.137125],[-152.126750,34.848375]]);
  }
}

module poly_path3646(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-32.651875],[-96.857500,-32.651875]]);
  }
}

module poly_path4698(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-140.525750,151.317125],[-135.665750,159.732125]]);
  }
}

module poly_path3962(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[240.642250,-91.718875],[240.642250,-47.421375]]);
  }
}

module poly_path4422(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-26.873875],[169.776250,-24.218875]]);
  }
}

module poly_path3714(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,3.204125],[-32.723750,5.859125]]);
  }
}

module poly_path4174(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-115.010750,110.781125],[-118.377000,110.781125]]);
  }
}

module poly_path3790(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-24.218875],[185.373000,-24.218875]]);
  }
}

module poly_path3650(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-100.223750,-32.651875],[-100.223750,-35.306875]]);
  }
}

module poly_path4614(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-94.373875],[169.776250,-91.718875]]);
  }
}

module poly_path3866(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-55.862875],[-152.126750,-100.151625]]);
  }
}

module poly_path3770(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[38.142250,-49.526875],[38.142250,-5.238125]]);
  }
}

module poly_path4326(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,40.626125],[169.776250,43.281125]]);
  }
}

module poly_path3894(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-111.248875],[-32.723750,-108.593875]]);
  }
}

module poly_path4230(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,34.848125],[-148.760750,32.193125]]);
  }
}

module poly_path3654(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-32.651875],[-148.760750,-35.306875]]);
  }
}

module poly_path4478(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-64.295875],[53.739500,-64.295875]]);
  }
}

module poly_path4706(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-143.333750,152.937125],[-140.526250,151.317125]]);
  }
}

module poly_path4622(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-47.420875],[169.776000,-47.420875]]);
  }
}

module poly_path3798(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-26.873875],[237.276250,-24.218875]]);
  }
}

module poly_path3702(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-43.748875],[-32.723750,-41.093875]]);
  }
}

module poly_path3658(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,-32.651875],[-148.760500,-32.651875]]);
  }
}

module poly_path4258(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,32.193125],[-100.223250,32.193125]]);
  }
}

module poly_path4162(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-161.873875],[188.738750,-161.873875]]);
  }
}

module poly_path4718(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[179.262250,-107.213000],[180.779320,-106.906711],[182.018188,-106.071438],[182.853461,-104.832570],[183.159750,-103.315500],[182.853461,-101.798430],[182.018188,-100.559563],[180.779320,-99.724289],[179.262250,-99.418000],[177.745180,-99.724289],[176.506312,-100.559563],[175.671039,-101.798430],[175.364750,-103.315500],[175.671039,-104.832570],[176.506312,-106.071438],[177.745180,-106.906711],[179.262250,-107.213000]]);
  }
}

module poly_path3970(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[237.276250,-94.373875],[188.738750,-94.373875]]);
  }
}

module poly_path3478(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-50.876750,102.348125],[-50.876750,146.636875]]);
  }
}

module poly_path3662(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,11.637125],[-148.760500,11.637125]]);
  }
}

module poly_path4066(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-32.723750,-178.748875],[-81.261250,-178.748875]]);
  }
}

module poly_path3874(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-102.806875],[-100.223250,-102.806875]]);
  }
}

module poly_path4526(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[50.373250,-131.795875],[53.739500,-131.795875]]);
  }
}

module poly_path4570(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,-159.218875],[169.776000,-159.218875]]);
  }
}

module poly_path4334(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[173.142250,87.579125],[169.776000,87.579125]]);
  }
}

module poly_path4238(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,79.137125],[-148.760500,79.137125]]);
  }
}

module poly_path3666(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,14.292125],[-148.760750,11.637125]]);
  }
}

module poly_path4462(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-108.593875],[105.642500,-108.593875]]);
  }
}

module poly_path4362(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,3.204125],[105.642500,3.204125]]);
  }
}

module poly_path4566(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[169.776250,-161.873875],[169.776250,-159.218875]]);
  }
}

module poly_path3670(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-96.857750,11.637125],[-96.857750,-32.651625]]);
  }
}

module poly_path4266(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,70.704125],[105.642500,70.704125]]);
  }
}

module poly_path4170(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-115.010750,155.079125],[-118.377000,155.079125]]);
  }
}

module poly_path4182(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-66.473750,108.126125],[-66.473750,110.781125]]);
  }
}

module poly_path3718(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-84.626750,-41.093875],[-84.626750,3.203625]]);
  }
}

module poly_path4694(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-182.825750,78.057125],[-177.965750,86.472125]]);
  }
}

module poly_path3794(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,-26.873875],[188.739250,-24.218875]]);
  }
}

module poly_path3674(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-152.126750,11.637125],[-152.126750,-32.651625]]);
  }
}

module poly_path3990(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-167.651875],[-148.760750,-170.306875]]);
  }
}

module poly_path4630(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[117.873250,-91.718875],[117.873250,-47.421375]]);
  }
}

module poly_path3882(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-81.260750,-64.295875],[-84.627000,-64.295875]]);
  }
}

module poly_path3786(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[188.739250,20.079125],[185.373000,20.079125]]);
  }
}

module poly_path3678(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,14.292125],[-100.223250,14.292125]]);
  }
}

module poly_path3910(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-84.626750,-108.593875],[-84.626750,-64.296375]]);
  }
}

module poly_path4370(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[102.276250,-41.093875],[102.276250,-43.748875]]);
  }
}

module poly_path4482(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[53.739250,-61.640875],[53.739250,-64.295875]]);
  }
}

module poly_path4654(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-195.074750,68.697125],[-193.392250,71.613375]]);
  }
}

module poly_path3682(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-148.760750,-35.306875],[-100.223250,-35.306875]]);
  }
}

module poly_path3814(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[185.373250,-24.218875],[185.373250,20.078625]]);
  }
}

