import SwiftUI

enum QuietlineTheme {
    static let backgroundTop = Color(red: 1.00, green: 0.78, blue: 0.89)
    static let backgroundBottom = Color(red: 0.72, green: 0.94, blue: 0.96)
    static let stageInk = Color(red: 0.13, green: 0.11, blue: 0.18)
    static let stageInkSoft = Color(red: 0.18, green: 0.16, blue: 0.24).opacity(0.82)
    static let panel = Color(red: 1.00, green: 0.97, blue: 0.995).opacity(0.90)
    static let panelElevated = Color(red: 1.00, green: 0.985, blue: 0.995).opacity(0.95)
    static let panelStrong = Color(red: 1.00, green: 0.94, blue: 0.98).opacity(0.98)
    static let panelSecondary = Color(red: 1.00, green: 0.84, blue: 0.93).opacity(0.56)
    static let panelMuted = Color(red: 0.78, green: 0.95, blue: 0.97).opacity(0.54)
    static let border = Color(red: 0.45, green: 0.27, blue: 0.40).opacity(0.12)
    static let borderStrong = Color(red: 0.45, green: 0.27, blue: 0.40).opacity(0.20)
    static let textPrimary = Color(red: 0.13, green: 0.11, blue: 0.18)
    static let textSecondary = Color(red: 0.40, green: 0.34, blue: 0.45)
    static let accent = Color(red: 0.91, green: 0.25, blue: 0.52)
    static let accentSoft = Color(red: 1.00, green: 0.66, blue: 0.78)
    static let accentSecondary = Color(red: 0.06, green: 0.69, blue: 0.78)
    static let hairClipBlue = Color(red: 0.16, green: 0.48, blue: 0.95)
    static let hairClipYellow = Color(red: 1.00, green: 0.83, blue: 0.17)
    static let stringLine = Color(red: 0.20, green: 0.18, blue: 0.26)
    static let success = Color(red: 0.16, green: 0.67, blue: 0.48)
    static let danger = Color(red: 0.88, green: 0.16, blue: 0.28)
    static let waveformInactive = Color.black.opacity(0.12)
    static let waveformMask = stageInk.opacity(0.46)
    static let selectionOverlay = hairClipYellow.opacity(0.30)

    static let backgroundGradient = LinearGradient(
        colors: [backgroundTop, Color(red: 1.00, green: 0.94, blue: 0.98), backgroundBottom],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct QuietlineBackdrop: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                QuietlineTheme.backgroundGradient

                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(QuietlineTheme.panelMuted)
                    .frame(width: geometry.size.width * 0.48, height: geometry.size.height * 0.42)
                    .rotationEffect(.degrees(-8))
                    .offset(x: geometry.size.width * 0.18, y: geometry.size.height * 0.30)

                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(QuietlineTheme.hairClipYellow.opacity(0.18))
                    .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.50)
                    .rotationEffect(.degrees(12))
                    .offset(x: geometry.size.width * 0.48, y: -geometry.size.height * 0.20)

                Path { path in
                    let height = geometry.size.height
                    let width = geometry.size.width
                    path.move(to: CGPoint(x: 0, y: height * 0.30))
                    path.addCurve(
                        to: CGPoint(x: width, y: height * 0.28),
                        control1: CGPoint(x: width * 0.30, y: height * 0.20),
                        control2: CGPoint(x: width * 0.66, y: height * 0.40)
                    )
                }
                .stroke(QuietlineTheme.accent.opacity(0.34), lineWidth: 2)

                Path { path in
                    let height = geometry.size.height
                    let width = geometry.size.width
                    path.move(to: CGPoint(x: 0, y: height * 0.31))
                    path.addCurve(
                        to: CGPoint(x: width, y: height * 0.29),
                        control1: CGPoint(x: width * 0.30, y: height * 0.21),
                        control2: CGPoint(x: width * 0.66, y: height * 0.41)
                    )
                }
                .stroke(QuietlineTheme.accentSecondary.opacity(0.34), lineWidth: 2)
            }
            .ignoresSafeArea()
        }
    }
}

struct HairClipMotif: View {
    var size: CGFloat = 54

    var body: some View {
        HStack(spacing: size * 0.08) {
            RoundedRectangle(cornerRadius: size * 0.12, style: .continuous)
                .fill(QuietlineTheme.hairClipBlue)
                .overlay(
                    RoundedRectangle(cornerRadius: size * 0.12, style: .continuous)
                        .stroke(QuietlineTheme.stageInk.opacity(0.18), lineWidth: 1)
                )
            RoundedRectangle(cornerRadius: size * 0.12, style: .continuous)
                .fill(QuietlineTheme.hairClipYellow)
                .overlay(
                    RoundedRectangle(cornerRadius: size * 0.12, style: .continuous)
                        .stroke(QuietlineTheme.stageInk.opacity(0.18), lineWidth: 1)
                )
        }
        .frame(width: size, height: size * 0.50)
        .rotationEffect(.degrees(-8))
        .shadow(color: QuietlineTheme.stageInk.opacity(0.16), radius: 8, y: 4)
    }
}

struct StudioPanelModifier: ViewModifier {
    var padding: CGFloat = 18
    var fill: Color = QuietlineTheme.panel

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(fill)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(QuietlineTheme.border, lineWidth: 1)
                    )
                    .overlay(alignment: .topLeading) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        QuietlineTheme.accent,
                                        QuietlineTheme.hairClipYellow,
                                        QuietlineTheme.accentSecondary
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(height: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .opacity(0.92)
                    }
            )
            .shadow(color: QuietlineTheme.stageInk.opacity(0.07), radius: 14, y: 6)
    }
}

extension View {
    func studioPanel(padding: CGFloat = 18, fill: Color = QuietlineTheme.panel) -> some View {
        modifier(StudioPanelModifier(padding: padding, fill: fill))
    }
}

struct PillButtonStyle: ButtonStyle {
    var fill: Color
    var foreground: Color
    var stroke: Color = QuietlineTheme.border

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundStyle(foreground)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(configuration.isPressed ? fill.opacity(0.78) : fill)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(stroke, lineWidth: 1)
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct IconButtonStyle: ButtonStyle {
    var fill: Color
    var foreground: Color
    var stroke: Color = QuietlineTheme.border
    var size: CGFloat = 42

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundStyle(foreground)
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(configuration.isPressed ? fill.opacity(0.78) : fill)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(stroke, lineWidth: 1)
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct StatusDot: View {
    let color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 3, style: .continuous)
            .fill(color)
            .frame(width: 9, height: 9)
            .rotationEffect(.degrees(-8))
    }
}
