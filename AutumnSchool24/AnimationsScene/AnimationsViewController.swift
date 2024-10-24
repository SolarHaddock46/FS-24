import UIKit
import Lottie

final class AnimationsViewController: UIViewController {

    private struct Constants {
        static let animationNames = ["animation1", "animation2", "animation3"]
        static let initialAnimationIndex = 0
        static let buttonDimension: CGFloat = 60
        static let buttonInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        static let playPausePointSize: CGFloat = 40
        static let controlButtonPointSize: CGFloat = 30
        static let sliderMinValue: Float = 0.5
        static let sliderMaxValue: Float = 2.0
        static let sliderInitialValue: Float = 1.0
        static let horizontalStackSpacing: CGFloat = 8
        static let verticalStackSpacing: CGFloat = 65
        static let controlButtonStackSpacing: CGFloat = 5
        static let controlsContainerStackSpacing: CGFloat = 10
        static let animationInfoStackSpacing: CGFloat = 8
        static let timecodeInitial = "0:00"
    }
    
    let animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupViews()
        loadAnimation(at: Constants.initialAnimationIndex, autoPlay: true)
    }
    
    func setupViews() {
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func loadAnimation(at index: Int, autoPlay: Bool) {
        let animationName = Constants.animationNames[index]
        animationView.animation = LottieAnimation.named(animationName)
        
        if autoPlay {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
    
    
    
}
