//Beware of adding, removing or moving any instructions
//Questions may relate to line numbers of the ORIGINAL program

int a;
int b;
int c;
int d;

void setup() {
    size(500, 500);   
    a = 300;
    b = 40;
    c = 60;
    d = 85;
}

void draw() {
    background(255);
    stroke(0);
    fill(0, 0, 255);
    ellipse(150, 70, 80, 70);  //DARK BLUE ellipse LINE 21
    fill(0, 255, 255);
    ellipse(200, 250, 45, 75);  //CYAN ellipse LINE 23
    fill(255, 0, 255);
    ellipse(250, a, c, 30);    //MAGENTA ellipse LINE 25
    fill(255, 0, 0);
    rect(230, 70, 80, 70);    //RED rectangle LINE 27
    fill(255, 255, 0);
    rect(50, 250, b, 85);    //YELLOW rectangle LINE 29
    fill(0, 255, 0);
    rect(250, 180, 65, 105);    //GREEN rectangle LINE 31
    fill(0, 0, 0);
    rect(mouseX + 10-10-50, mouseY - 20+20, 50, 50);    //BLACK rectangle LINE 33
}  
