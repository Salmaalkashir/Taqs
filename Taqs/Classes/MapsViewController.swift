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
    var customAnnotationView: CustomAnnotationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocation(latitude: 33.44, longitude: -94.04)
        SetLocation(location: location, distance: 10000)
        AddAnnotation()
        Map.delegate = self
        viewmodel = ViewModel()
        customAnnotationView = CustomAnnotationView()
        viewmodel?.getForecast(lattitude: 33.44, logitude: -94.04)
        viewmodel?.bindingResultToHomeViewController =
        {
            DispatchQueue.main.async{ [self] in
                self.forecast = self.viewmodel?.forecastResult
                self.customAnnotationView?.label.text = String(Int(round(self.forecast?.current?.temp ?? 0.0))).appending("°")
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
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 33.44, longitude: -94.04)
        annotation.title = "SS"
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
        
        if let customAnnotationView = annotationView as? CustomAnnotationView {
            customAnnotationView.label.text = String(Int(round(self.forecast?.current?.temp ?? 0.0))).appending("°")
            
        }
        return annotationView
    }
}

class CustomAnnotationView: MKAnnotationView {
     var label: UILabel!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        // Customize the appearance of the annotation view
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        self.backgroundColor = .clear

        // Add a label to the annotation view
        self.label = UILabel(frame: CGRect(x: 10, y: 10, width: 180, height: 40))
        self.label.textColor = .white
        self.label.font = UIFont.boldSystemFont(ofSize: 14)
        self.image = UIImage(named: "whitcirlce")
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

