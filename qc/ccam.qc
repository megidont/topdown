void () CCam;

void () CCamChasePlayer =
{
   local entity hack;
   hack = spawn();
   hack.movetype = MOVETYPE_FLY;
   hack.solid = SOLID_NOT;
   self.v_angle_x = 0;
   self.punchangle_x = 90;
//   stuffcmd(self, "-lookup\n");
//   stuffcmd(self, "-lookdown\n");
//   stuffcmd(self, "-mlook\n");
//   stuffcmd(self, "centerview\n");
//   stuffcmd(self, "cl_rollangle 0\n");
   makevectors (self.v_angle);
   traceline ((self.origin + self.view_ofs),((self.origin + self.view_ofs) + (v_up * self.camview_x)),FALSE,self);
   setorigin (self.trigger_field,trace_endpos);
   setorigin (hack,trace_endpos);
   WriteByte (MSG_ONE,5);
   WriteEntity (MSG_ONE,self.trigger_field);
   msg_entity = self;
   WriteByte (MSG_ONE, 10);
   WriteAngle (MSG_ONE, 0);
   WriteAngle (MSG_ONE, hack.angles_y);
   WriteAngle (MSG_ONE, hack.angles_z);
   self.weaponmodel = "";
};

void () CCam =
{
     local entity camera;
     local entity spot;

    camera = spawn ();
    spot = spawn ();
    self.trigger_field = camera;
    camera.classname = "camera";
    camera.movetype = MOVETYPE_FLY;
    camera.solid = SOLID_SLIDEBOX;
    setmodel (camera,"progs/eyes.mdl");
    setsize (camera,'0 0 0','0 0 0');
    makevectors (self.v_angle);
    traceline ((self.origin + self.view_ofs),(((self.origin + self.view_ofs) + (v_up * -64.000))),FALSE,self);
    self.camview = '192 0 0'; // added
    setorigin (camera,trace_endpos);
    camera.angles_x = 90;
    camera.angles_y = self.angles_y;
    camera.angles_z = self.angles_z;
    self.weaponmodel = "";
    msg_entity = self;
    WriteByte (MSG_ONE,5);
    WriteEntity (MSG_ONE,camera);
    WriteByte (MSG_ONE,10.000);
    WriteAngle (MSG_ONE,camera.angles_x);
    WriteAngle (MSG_ONE,camera.angles_y);
    WriteAngle (MSG_ONE,camera.angles_z);
};
