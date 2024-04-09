//
//  UIView+AutoLayout.swift
//  LogIn
//
//  Created by Enzo Boragina on 26/03/24.
//
import Foundation

protocol ViewCodeType {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodeType {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
