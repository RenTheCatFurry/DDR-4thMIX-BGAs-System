local layer1 = {
    textures = {
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {2,1,0},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {5,3,4},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv001 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv002 5x4 (stretch).png",
            size = {64,60},
            frames = {5,4,3},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {0,2,1},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {3,4,5},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {5,3,4},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv001 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv002 5x4 (stretch).png",
            size = {64,60},
            frames = {5,4,3},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {0,2,1},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {3,4,5},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv001 5x4 (stretch).png",
            size = {64,60},
            frames = {1,2,0},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv001 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv002 5x4 (stretch).png",
            size = {64,60},
            frames = {5,4,3},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {0,2,1},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {3,4,5},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv001 5x4 (stretch).png",
            size = {64,60},
            frames = {1,2,0},
            delay = 1/3,
            properties = {"framesbeat"}
        },
        {
            img = "rapp/b87_rapp hsv002 5x4 (stretch).png",
            size = {64,60},
            frames = {3,5,4},
            delay = 1/3,
            properties = {"framesbeat"}
        }
    },
    blinkalpha = 0.92,
    scroll = {2,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}