import Phaser from 'phaser';

let config = {
  type: Phaser.AUTO,
  width: 1920,
  height: 1080,
  physics: {
    default: 'arcade',
    arcade: {
      gravity: {
        y: -180,
      },
    },
  },
  scene: {
    preload: preload,
    create: create,
    update: update,
  },
};

const game = new Phaser.Game(config);

var nurek;
var atmosfera;
function preload() {
  this.load.image('nurek', './assets/nurek.png');
}


function create() {
  var woda = this.add.rectangle(0, 101, 800, 600, 0x2020c0);
  woda.setOrigin(0, 0);
  atmosfera = this.add.rectangle(0, 0, 800, 100, 0xe0e0f0);
  atmosfera.setOrigin(0, 0);
  this.physics.add.existing(atmosfera);
  atmosfera.body.setCollideWorldBounds();

  nurek = this.physics.add.sprite(100, 100, 'nurek');
  nurek.setBounce(0.2);
  nurek.setCollideWorldBounds(true);
  this.physics.add.collider(nurek, atmosfera);
}

function update() {
  let cursors = this.input.keyboard.createCursorKeys();
  if (cursors.right.isDown) {
    nurek.setVelocityX(10);
  }
  if (cursors.left.isDown) {
    nurek.setVelocityX(-10);
  }
  if (cursors.down.isDown) {
    nurek.setVelocityY(100);
  }
}
