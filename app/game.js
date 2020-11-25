var config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    scene: {
        preload: preload,
        create: create,
        update: update
    }
};

var game = new Phaser.Game(config);
var nurek;

function preload ()
{
    this.load.image("nurek","./assets/nurek.png");
}

function create ()
{
    nurek = this.physics.add.sprite(100,100,"nurek");
    player.setBounce(0.2);
    player.setCollideWorldBounds(true);

}

function update ()
{
    let cursors = this.input.keyboard.createCursorKeys();
    if(cursors.right.isDown)
    {
        nurek.setVelocityX(10);
    }
    if(cursors.left.isDown)
    {
        nurek.setVelocityX(-10);
    }
}