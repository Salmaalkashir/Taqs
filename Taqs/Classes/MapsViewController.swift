//
//  MapsViewController.swift
//  Taqs
//
//  Created by Salma on 01/07/2023.
//

import UIKit
import MapKit
import CoreLocation

class MapsViewController: UIViewController ,  MKMapViewDelegate {
    
    @IBOutlet weak var Map: MKMapView!
    var forecast: Forecast?
    var viewmodel: ViewModel?
    var temp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Map.delegate = self
        viewmodel = ViewModel()
        
        let location = CLLocation(latitude: 31.2001, longitude: 29.9187)
        SetLocation(location: location, distance: 1000000)
       
        viewmodel?.getForecast(lattitude: 31.2001, logitude: 29.9187)
        viewmodel?.bindingResultToHomeViewController =
        {
            DispatchQueue.main.async{ [self] in
                self.forecast = self.viewmodel?.forecastResult
                self.temp = (String(Int(round(self.forecast?.current?.temp ?? 0.0))).appending("°"))
                self.AddAnnotation()
            }
        }
    }
    
    
    func SetLocation(location:CLLocation, distance: CLLocationDistance)
    {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance , longitudinalMeters: distance)
        Map.setRegion(region, animated: true)
    }
    
    
    func AddAnnotation()
    {
        var color: String?
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 31.2001, longitude: 29.9187)
        annotation.title = temp
        Map.addAnnotation(annotation)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let identifier = "CustomAnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
       /* if let customAnnotationView = annotationView as? CustomAnnotationView {
            customAnnotationView.label.text = String(Int(round(self.forecast?.current?.temp ?? 0.0))).appending("°")
            
        }*/
        return annotationView
    }
}



class CustomAnnotationView: MKAnnotationView {
     var label: UILabel!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        self.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        self.backgroundColor = .clear

        self.label = UILabel(frame: CGRect(x: 10, y: 10, width: 180, height: 40))
        self.label.textColor = .red
        self.label.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

