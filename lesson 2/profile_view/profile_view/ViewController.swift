import UIKit

final class ViewController: UIViewController {
    
    private let grey = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    private let leadingInset: CGFloat = 16
    
    private let arrayLabels: [(String, String)] = [("Sex", "Woman"), ("Work", "Developer"), ("Company", "Apple"), ("City", "Moscow"), ("Age", "27")]
    private let arrayFamily:[(String, String, String)] = [("Mother", "Samanta Klueva", "15.06.1978"), ("Father", "John Kluev", "01.02.1975"), ("Sister", "Jane Klueva", "01.02.2005")]
    
    private lazy var photo: UIImageView = createImageView(named: "frog", diameter: 50)
    private lazy var firstMainStackView = createStackView(axis: .horizontal, alignment: .leading)
    private lazy var firstStackView = createStackView(axis: .vertical, spacing: 0, alignment: .leading)
    private lazy var mainStackView = createStackView(axis: .vertical, spacing: 16, alignment: .fill)
    private lazy var interiorStackView = createStackView(axis: .vertical, spacing: 8, alignment: .leading)
    private lazy var interiorStackViewForTrio = createStackView(axis: .vertical, spacing: 8, alignment: .fill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        setupFirstStackView()
        setupMainStackView()
    }

    private func setupFirstStackView() {
        addLabelToStackView(firstStackView, text: "Hampty Dumpty", size: 17, color: .black)
        addLabelToStackView(firstStackView, text: "01.02.2003", size: 15, color: grey)
        firstMainStackView.addArrangedSubview(firstStackView)
        firstMainStackView.addArrangedSubview(photo)
        setupConstraintsFor(stackView: firstMainStackView, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    }

    private func setupMainStackView() {
        addLabelToStackView(mainStackView, text: "User Info", size: 19, color: .brown)
        setupInteriorStackView()
        addLabelToStackView(mainStackView, text: "Family", size: 17, color: .brown)
        setupInteriorStackViewForTrio()
        setupConstraintsFor(stackView: mainStackView, topAnchor: firstStackView.bottomAnchor, topConstant: 38)
    }

    private func setupInteriorStackView() {
        for (label, text) in arrayLabels {
            addKeyValueToStackView(interiorStackView, key: label, value: text, keyColor: grey)
            addSpacerToStackView(interiorStackView, spacing: 16)
        }
        mainStackView.addArrangedSubview(interiorStackView)
    }

    private func setupInteriorStackViewForTrio() {
        for (relation, name, date) in arrayFamily {
            addFamilyDataToStackView(interiorStackViewForTrio, relation: relation, name: name, date: date)
            addSpacerToStackView(interiorStackViewForTrio, spacing: 16)
        }
        mainStackView.addArrangedSubview(interiorStackViewForTrio)
    }

    private func addKeyValueToStackView(_ stackView: UIStackView, key: String, value: String, keyColor: UIColor) {
        addLabelToStackView(stackView, text: key, size: 15, color: keyColor)
        addLabelToStackView(stackView, text: value, size: 17, color: .black)
    }

    private func addFamilyDataToStackView(_ stackView: UIStackView, relation: String, name: String, date: String) {
        let labelView = createLabel(text: relation, size: 17, color: .black)
        let nameView = createLabel(text: name, size: 15, color: .black)
        let dataView = createLabel(text: date, size: 15, color: .black)
        let horizontalStack = createStackView(axis: .horizontal, distribution: .equalSpacing)
        horizontalStack.addArrangedSubview(nameView)
        horizontalStack.addArrangedSubview(dataView)
        let verticalStack = createStackView(axis: .vertical)
        verticalStack.addArrangedSubview(labelView)
        verticalStack.addArrangedSubview(horizontalStack)
        stackView.addArrangedSubview(verticalStack)
    }

    private func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    private func createLabel(text: String, size: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: size, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createImageView(named: String, diameter: CGFloat) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: named))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        imageView.layer.cornerRadius = diameter / 2
        imageView.clipsToBounds = true
        return imageView
    }

    private func addLabelToStackView(_ stackView: UIStackView, text: String, size: CGFloat, color: UIColor) {
        stackView.addArrangedSubview(createLabel(text: text, size: size, color: color))
    }

    private func addSpacerToStackView(_ stackView: UIStackView, spacing: CGFloat) {
        let spacerStackView = createStackView(axis: .vertical)
        spacerStackView.spacing = spacing
        stackView.addArrangedSubview(spacerStackView)
    }

    private func setupConstraintsFor(stackView: UIStackView, topAnchor: NSLayoutYAxisAnchor, topConstant: CGFloat = 0) {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: topConstant),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
