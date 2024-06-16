//
//  ProfileFireBaseManager.swift
//  HW 1 Singleton without navigation
//
//  Created by Игорь Крысин on 13.06.2024.
//

import Foundation
import Firebase
import FirebaseStorage

class ProfileFireBaseManager {
    
    private func getUID() -> String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    func loadavatarUrl(completion: @escaping (Result<URL, Error>) -> Void) {
        Firestore.firestore()
            .collection("users")
            .document(getUID())
            .getDocument { snap, err in
                guard err == nil else {
                    completion(.failure(err!))
                    return
                }
                
                if let document = snap {
                    
                    if let urlString = document["avatarUrl"] as? String,
                       let url = URL(string: urlString) {
                        completion(.success(url))
                    }
                }
            }
    }
    
    func uploadImage(imageData: Data) {
        let imageName = UUID().uuidString + ".jpeg"
        let reference = Storage.storage().reference().child(getUID() + "/avatars/").child(imageName)
        
        self.oneImageUpload(image: imageData, storageLink: reference) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let url):
                self.saveUserAvatar(urlString: url.absoluteString)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveUserAvatar(urlString: String) {
        Firestore.firestore()
            .collection("users")
            .document(getUID())
            //.setData(["avatarUrl":urlString], merge: true)
            .updateData(["avatarUrl":urlString])
            
    }
    
    private func oneImageUpload(image: Data?, storageLink: StorageReference, completion: @escaping (Result<URL, Error>) -> ()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        guard let imageData = image else { return }
        
        storageLink.putData(imageData, metadata: metadata) { meta, err in
            guard err == nil else {
                completion(.failure(err!))
                return
            }
            storageLink.downloadURL { url, err in
                guard err == nil else {
                    completion(.failure(err!))
                    return
                }
                guard let url = url else {
                    completion(.failure(err!))
                    return
                }
                
                completion(.success(url))
            }
        }.observe(.progress) { snap in
            print(snap.progress?.completedUnitCount )
        }
    }
}
