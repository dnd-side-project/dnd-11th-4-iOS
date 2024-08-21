//
//  LoginViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/19/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit
import AuthenticationServices

final class LoginViewController: UIViewController {
    typealias Reactor = LoginReactor
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private let descriptionLabel: MDLabel = {
        let label = MDLabel(attributedString: NSAttributedString.pretendardSB16("방방곡곡 대한민국 도장깨기"), textColor: .gray80, alignment: .center)
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.logoBlack
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageStart
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    private let appleLoginButton: MDButton = {
        let button = MDButton(backgroundColor: .mapBlack)
        button.setImage(image: Constant.Image.btnAppleLogin!)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.layer.cornerRadius = 12
        return button
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindLoginButton()
    }
    
    init(reactor: LoginReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .mapWhite
        
        view.addSubviews(descriptionLabel, logoImageView, flagImageView, appleLoginButton)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(170)
            $0.leading.trailing.equalToSuperview()
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(68)
            $0.centerX.equalToSuperview()
        }
        
        flagImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(380)
            $0.centerX.equalToSuperview()
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-43)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
    }
    
    private func bindLoginButton() {
        appleLoginButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.startAppleLogin()
            })
            .disposed(by: disposeBag)
    }
    
    private func startAppleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let _ = appleIDCredential.user
            let _ = appleIDCredential.fullName
            let _ = appleIDCredential.email
            
            if let identityToken = appleIDCredential.identityToken,
               let appleTokenString = String(data: identityToken, encoding: .utf8) {
                reactor?.action.onNext(.loginSuccess(appleTokenString))
            }
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        reactor?.action.onNext(.loginFailure(error))
    }
}

extension LoginViewController: View {
    func bind(reactor: LoginReactor) {
        reactor.state
            .map { $0.identityToken }
            .asDriver(onErrorJustReturn: "token error")
            .drive(onNext: { [weak self] token in
                guard let self = self else { return }
                if let token = token {
                    print("identityToken: \(token)")
                    self.navigateToViewController(viewController: ServiceAcceptViewController(reactor: ServiceAcceptReactor()))
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state
            .map { ($0.error, $0.identityToken) }
            .subscribe(onNext: { error, token in
                if let error = error, token == nil {
                    print("로그인 실패: \(error.localizedDescription)")
                }
            })
            .disposed(by: disposeBag)
    }
}
