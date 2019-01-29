//
//  ViewController.swift
//  LineChartExample
//
//  Created by Osian on 13/07/2017.
//  Copyright © 2017 Osian. All rights reserved.
//

// 참고 자료 : https://github.com/osianSmith/LineChartExample
/*
 1. swift 3 -> 4로 내가 바꿔야.. ? -> 그럼 문법, 버전별 차이도?
 2. 외국개발자가 설명해놓은 글과 깃허브 코드가 있는데(위쪽 링크 참고) 이걸 내 앱 배포할때 걸리는게 없는지 (오픈소스 허용은 copyright 참고)
 3.
 
 */

import UIKit
import Charts // You need this line to be able to use Charts Library
class ViewController: UIViewController {

    @IBOutlet weak var txtTextBox: UITextField!
    @IBOutlet weak var chtChart: LineChartView!

    var numbers : [Double] = [] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// This is the button trigger
    ///
    /// - Parameter sender: Sender
    @IBAction func btnbutton(_ sender: Any) {
        let input  = Double(txtTextBox.text!) //gets input from the textbox - expects input as double/int

    //numbers배열에 사용자가 입력한 숫자가 input으로 들어감.
        numbers.append(input!) //here we add the data to the array.
        updateGraph()
    }

    func updateGraph(){
    // lineChartEntry는 ChartDataEntry형의 데이터를 담는 배열이다.
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.

        
        
        //here is the for loop
        for i in 0..<numbers.count {
    // 라인 그래프 상의 한 점이 value로 지정되면
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
    // 이 데이터들을 담는 배열인 lineChartEntry에 이 값을 넣는다.
            lineChartEntry.append(value) // here we add it to the data set
        }

    // Entry는 (x,y)쌍 = value
    // value들이 담긴 배열 lineChartEntry
    // line1은 이 배열을 data set으로 전환한것 (점들이 모여서 set을 형성하면 라인 그래프가 되는 느낌)
         let line1 = LineChartDataSet(values: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet

        line1.colors = [NSUIColor.blue] //Sets the colour to blue

    //실제 차트에 보이는 코드
        let data = LineChartData() //This is the object that will be added to the chart

        data.addDataSet(line1) //Adds the line to the dataSet
        

        chtChart.data = data //finally - it adds the chart data to the chart and causes an update

        chtChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph

    }



}


