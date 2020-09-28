import org.gicentre.utils.stat.*;
import java.lang.management.ManagementFactory;
import com.sun.management.OperatingSystemMXBean;
BarChart barChart;
BarChart barChartmemory;
float[] values;

int i = 0;
int j = 0;
int exp=1;
Button on_button;
Button on_button1;
Button on_button2;
Button on_button3;
Button on_button4;
Button on_button5;
Button on_button6;
Button on_button7;
int clkbubble = 1;
int clkselection = 1;
int clkradix = 1;
int clkquick = 1;
int clkinsertion = 1;
int clkgrafik = 1;
int clkgrafikmemory = 1;
int clkgeri=1;
int bubbletime=0;
int selectiontime=0;
int radixtime=0;
int quicktime=0;
int insertiontime=0;
float[] times= new float[5];
float[] memory= new float[5];
void setup() {
  fullScreen(P2D);
  values = new float[width];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
    //values[i] = noise(i/100.0)*height;
  }
  smooth();

  // create the button object
  on_button = new Button("Bubble Sort", 20, 100, 200, 75);
  on_button1 = new Button("Selection Sort", 20, 200, 200, 75);
  on_button2 = new Button("Radix Sort", 20, 300, 200, 75);
  on_button3 = new Button("Quick Sort", 20, 400, 200, 75);
  on_button4 = new Button("Insertion Sort", 20, 500, 200, 75);
  on_button5 = new Button("Grafik(ms)", 20, 600, 200, 75);
  on_button7 = new Button("Grafik(memory)", 240, 600, 200, 75);
  on_button6 = new Button("<- Geri", 1120, 20, 200, 75);
  barChart = new BarChart(this);
  barChart.setData(times);
  barChart.setMinValue(0);
  barChart.setMaxValue(25);
  barChartmemory = new BarChart(this);
  barChartmemory.setData(memory);
  barChartmemory.setMinValue(0);
  barChartmemory.setMaxValue(500);
  textFont(createFont("Serif",30),30);

  barChart.showValueAxis(true);

  barChart.setBarLabels(new String[] {"Bubble Sort","Selection Sort","Radix Sort",
                                       "Quick Sort","Insertion Sort"});
  barChart.showCategoryAxis(true);


  barChartmemory.showValueAxis(true);

  barChartmemory.setBarLabels(new String[] {"Bubble Sort","Selection Sort","Radix Sort",
                                       "Quick Sort","Insertion Sort"});
  barChartmemory.showCategoryAxis(true);
}
OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(
                OperatingSystemMXBean.class);
void draw() {
  // draw a square if the mouse curser is over the button
  background(0);


  fill(255);
  text("Oğuzhan Zeyveli", 1000, 600);
  on_button.Draw();
  on_button1.Draw();
  on_button2.Draw();
  on_button3.Draw();
  on_button4.Draw();
  on_button5.Draw();
  on_button7.Draw();


  //bubble sort
  if(clkbubble==2){
    background(0);

  if (i < values.length) {
    for (int j = 0; j < values.length-i-1; j++) {
      float a = values[j];
      float b = values[j+1];
      if (a > b) {
        Bubbleswap(values, j, j+1);
         stroke(59,23,122);
      }
    }
  } else {
    clkbubble=1;
    i=0;
    values = new float[width];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(height);
    //values[i] = noise(i/100.0)*height;
    }
    i=-1;



    redraw();


  }
  i++;

  for (int i = 0; i < values.length; i++) {
    stroke(255);
    line(i, height, i, height - values[i]);
  }


  }





  //selection sort
  if(clkselection==2){
    background(0);

  if (i < values.length) {

      for (int j = i; j < values.length; j++) {

        if ( values[j] <  values[i]) {
        Selectionswap(values, j, i);
         stroke(59,23,122);

      }
      }


  } else {

      clkselection=1;
      i=-1;
      values = new float[width];
      for (int i = 0; i < values.length; i++) {
        values[i] = random(height);
        //values[i] = noise(i/100.0)*height;
      }


      redraw();


    }
    i++;

    for (int i = 0; i < values.length; i++) {
      stroke(255);

      line(i, height, i, height - values[i]);
    }

  }





  //radix sort
  if(clkradix==2){
    background(0);
    float m = values[0];
        for (int i = 1; i < values.length; i++)
            if (values[i] > m)
                m = values[i];




  if (m/exp > 0) {
    float output[] = new float[values.length]; // output array
        int i;
        int count[] = new int[10];


        // Store count of occurrences in count[]
        for (i = 0; i < values.length; i++)
            count[ int(values[i]/exp)%10 ]++;

        // Change count[i] so that count[i] now contains
        // actual position of this digit in output[]
        for (i = 1; i < 10; i++)
            count[i] += count[i - 1];

        // Build the output array
        for (i = values.length - 1; i >= 0; i--)
        {
            output[count[ int(values[i]/exp)%10 ] - 1] = values[i];
            count[ int(values[i]/exp)%10 ]--;
        }

        // Copy the output array to arr[], so that arr[] now
        // contains sorted numbers according to curent digit
        for (i = 0; i < values.length; i++){
            values[i] = output[i];

        }
        delay(1000);
        for (int p = 0; p < values.length; p++) {
        stroke(255);
        line(p, height, p, height - values[p]);

        }


  } else {
    clkradix=1;
    exp=1;
    values = new float[width];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(height);

    //values[i] = noise(i/100.0)*height;
    }
    exp=1;



    redraw();


  }
  exp*=10;



  }


  // quick sort
  if(clkquick==2){
    background(0);

    int start = millis();
    sort(values,0,values.length-1);

    int timer = millis()-start;
   times[3]=float(timer);
   println(times[0]);
   println(times[1]);
   println(times[2]);
   println(times[3]);
   println(times[4]);
   memory[3]=osBean.getCommittedVirtualMemorySize()/1024/1024;
   println(memory[0]);
   println(memory[1]);
   println(memory[2]);
   println(memory[3]);
   println(memory[4]);

    clkquick=1;

    values = new float[width];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(height);

    //values[i] = noise(i/100.0)*height;
    }
    redraw();
  }





  //insertion sort

   if(clkinsertion==2){
    background(0);

      if (i < values.length) {
        float key = values[i];
                int j = i-1;


                while (j>=0 && values[j] > key)
                {
                    values[j+1] = values[j];
                    j = j-1;
                }
                values[j+1] = key;
      } else {
        clkinsertion=1;
        i=0;
        values = new float[width];
        for (int i = 0; i < values.length; i++) {
          values[i] = random(height);
        //values[i] = noise(i/100.0)*height;
        }
        i=-1;



        redraw();


       }
      i++;

      for (int i = 0; i < values.length; i++) {
        stroke(255);
        line(i, height, i, height - values[i]);
      }


   }



  if(clkgrafik==2){
    background(0);

    barChart.draw(15,15,width-30,height-30);
    on_button6.Draw();

    if(clkgeri==2){
      clkgeri=1;
      clkgrafik=1;
      redraw();
    }


  }
  if(clkgrafikmemory==2){
    background(0);

    barChartmemory.draw(15,15,width-30,height-30);
    on_button6.Draw();

    if(clkgeri==2){
      clkgeri=1;
      clkgrafikmemory=1;
      redraw();
    }


  }

}

// mouse button clicked
void mousePressed()
{
  if (on_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("ClickedBubble: ");
    println(clkbubble++);
    Bubbletimer();

  }
  if (on_button1.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("ClickedSelection: ");
    println(clkselection++);
    Selectiontimer();

  }
  if (on_button2.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("ClickedRadix: ");
    println(clkradix++);
    Radixtimer();
  }
  if (on_button3.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("ClickedQuick: ");
    println(clkquick++);
  }
  if (on_button4.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("ClickedInsertion: ");
    println(clkinsertion++);
    Insertiontimer();
  }
  if (on_button5.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Grafik: ");
    println(clkgrafik++);

  }
  if (on_button6.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("<-Geri: ");
    println(clkgeri++);

  }
  if (on_button7.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Grafikmemory: ");
    println(clkgrafikmemory++);

  }
}

// the Button class
class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button

  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }

  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
void Bubbletimer(){
  float [] arr = new float[width];
    for (int i = 0; i < arr.length; i++) {
      arr[i] = random(height);
    }
   int start = millis();

   int i, j;
   for (i = 0; i < arr.length-1; i++){

       // Last i elements are already in place
       for (j = 0; j < arr.length-i-1; j++){
           if (arr[j] > arr[j+1]){
              float temp = arr[j];
              arr[j] = arr[j+1];
              arr[j+1] = temp;
           }
        }
    }
   int timer = millis()-start;
   times[0]=float(timer);
   println(times[0]);
   println(times[1]);
   println(times[2]);
   println(times[3]);
   println(times[4]);
   memory[0]=osBean.getCommittedVirtualMemorySize()/1024/1024;
        println(memory[0]);
        println(memory[1]);
        println(memory[2]);
        println(memory[3]);
        println(memory[4]);


}
void Selectiontimer(){

  float [] arr = new float[width];
    for (int i = 0; i < arr.length; i++) {
      arr[i] = random(height);
    }
   int start = millis();

  int i, j, min_idx;

    // One by one move boundary of unsorted subarray
    for (i = 0; i < arr.length-1; i++){
        // Find the minimum element in unsorted array
        min_idx = i;
        for (j = i+1; j < arr.length; j++){
          if (arr[j] < arr[min_idx]){
            min_idx = j;

          }
          float temp = arr[min_idx];
              arr[min_idx] = arr[i];
              arr[i] = temp;
       }
  }
    int timer = millis()-start;
     times[1]=float(timer);
     println(times[0]);
     println(times[1]);
     println(times[2]);
     println(times[3]);
     println(times[4]);
     memory[1]=osBean.getCommittedVirtualMemorySize()/1024/1024;
        println(memory[0]);
        println(memory[1]);
        println(memory[2]);
        println(memory[3]);
        println(memory[4]);
}

void Radixtimer(){
  int start = millis();
  float m = values[0];
        for (int i = 1; i < values.length; i++)
            if (values[i] > m)
                m = values[i];




  for (int exp = 1; m/exp > 0; exp *= 10){
    float output[] = new float[values.length]; // output array
        int i;
        int count[] = new int[10];


        // Store count of occurrences in count[]
        for (i = 0; i < values.length; i++)
            count[ int(values[i]/exp)%10 ]++;

        // Change count[i] so that count[i] now contains
        // actual position of this digit in output[]
        for (i = 1; i < 10; i++)
            count[i] += count[i - 1];

        // Build the output array
        for (i = values.length - 1; i >= 0; i--)
        {
            output[count[ int(values[i]/exp)%10 ] - 1] = values[i];
            count[ int(values[i]/exp)%10 ]--;
        }

        // Copy the output array to arr[], so that arr[] now
        // contains sorted numbers according to curent digit
        for (i = 0; i < values.length; i++){
            values[i] = output[i];

        }


  }
  int timer = millis()-start;
   times[2]=float(timer);
   println(times[0]);
   println(times[1]);
   println(times[2]);
   println(times[3]);
   println(times[4]);
   memory[2]=osBean.getCommittedVirtualMemorySize()/1024/1024;
        println(memory[0]);
        println(memory[1]);
        println(memory[2]);
        println(memory[3]);
        println(memory[4]);


  }

  void Insertiontimer(){

    float [] arr = new float[width];
    for (int i = 0; i < arr.length; i++) {
      arr[i] = random(height);
    }
    int start = millis();
    int n = arr.length;
        for (int i=1; i<n; ++i)
        {
            float key = arr[i];
            int j = i-1;

            /* Move elements of arr[0..i-1], that are
               greater than key, to one position ahead
               of their current position */
            while (j>=0 && arr[j] > key)
            {
                arr[j+1] = arr[j];
                j = j-1;
            }
            arr[j+1] = key;
        }
        int timer = millis()-start;
        times[4]=float(timer);
        println(times[0]);
        println(times[1]);
        println(times[2]);
        println(times[3]);
        println(times[4]);

        memory[4]=osBean.getCommittedVirtualMemorySize()/1024/1024;
        println(memory[0]);
        println(memory[1]);
        println(memory[2]);
        println(memory[3]);
        println(memory[4]);
        for (int i = 0; i < arr.length; i++) {
          arr[i] = random(height);
        }
  }











void Bubbleswap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
void Selectionswap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

int partition(float arr[], int low, int high)
    {

        float pivot = arr[high];
        int i = (low-1); // index of smaller element
        for (int j=low; j<high; j++)
        {
            // If current element is smaller than or
            // equal to pivot
            if (arr[j] <= pivot)
            {
                i++;

                // swap arr[i] and arr[j]
                float temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;

            }
        }

        // swap arr[i+1] and arr[high] (or pivot)
        float temp = arr[i+1];
        arr[i+1] = arr[high];
        arr[high] = temp;

        return i+1;
    }


    /* The main function that implements QuickSort()
      arr[] --> Array to be sorted,
      low  --> Starting index,
      high  --> Ending index */
    void sort(float arr[], int low, int high)
    {

        if (low < high)
        {
            /* pi is partitioning index, arr[pi] is
              now at right place */
            int pi = partition(arr, low, high);

            // Recursively sort elements before
            // partition and after partition
            sort(arr, low, pi-1);

            sort(arr, pi+1, high);


        }





    }
