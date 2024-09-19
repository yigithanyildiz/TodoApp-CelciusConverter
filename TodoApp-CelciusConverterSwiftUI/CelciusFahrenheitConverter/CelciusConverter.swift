import SwiftUI

struct CelciusConverter: View {
    @State private var celsius: String = ""
    @State private var fahrenheit: String = ""
    @State private var isCelsiusToFahrenheit: Bool = true
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text(isCelsiusToFahrenheit ? "Celsius to Fanrenheit" : "Fahrenheit to Celcius").font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                
                HStack {
                    VStack {
                        
                        Text(isCelsiusToFahrenheit ? "Celsius" : "Fahrenheit")
                            .foregroundStyle(Color.white)
                        TextField("", text: isCelsiusToFahrenheit ? $celsius : $fahrenheit)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .padding()
                    }
                    
                    Button(action: convert) {
                        Image(systemName: "arrow.right.arrow.left.circle")
                            .labelStyle(IconOnlyLabelStyle())
                            .font(.system(size: 40))
                            .padding()
                            .foregroundColor(.blue)
                    }.buttonStyle(PlainButtonStyle())
                    
                    VStack {
                        Text(isCelsiusToFahrenheit ? "Fahrenheit" : "Celsius")
                            .foregroundStyle(Color.white)//
                        TextField("", text: isCelsiusToFahrenheit ? $fahrenheit : $celsius)
                            .textFieldStyle(RoundedBorderTextFieldStyle())                            .keyboardType(.decimalPad)
                            .padding()
                            .disabled(true)
                    }
                }
                
                Button(action: switchConversionDirection) {
                    Text("Switch Conversion")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .padding()
        }
        
    }
    
    private func convert() {
        if isCelsiusToFahrenheit {
            if let celsiusValue = Double(celsius) {
                let fahrenheitValue = (celsiusValue * 9 / 5) + 32
                fahrenheit = String(format: "%.2f", fahrenheitValue)
            } else {
                fahrenheit = "Invalid Input"
            }
        } else {
            if let fahrenheitValue = Double(fahrenheit) {
                let celsiusValue = (fahrenheitValue - 32) * 5 / 9
                celsius = String(format: "%.2f", celsiusValue)
            } else {
                celsius = "Invalid Input"
            }
        }
    }
    
    private func switchConversionDirection() {
        isCelsiusToFahrenheit.toggle()
        celsius = ""
        fahrenheit = ""
    }
}

#Preview {
    CelciusConverter()
}
