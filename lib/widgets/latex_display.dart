import 'package:flutter/material.dart';

/// Displays a formula string in a styled monospace text widget.
/// (flutter_math_fork replaced with plain text for stability.)
class LatexDisplay extends StatelessWidget {
  const LatexDisplay({
    super.key,
    required this.latex,
    this.fontSize = 18,
    this.color,
    this.textScaleFactor = 1.2,
  });

  final String latex;
  final double fontSize;
  final Color? color;
  final double textScaleFactor;

  // Convert common LaTeX commands to readable Unicode/text
  static String _toReadable(String s) {
    return s
        .replaceAll(r'\dfrac{', '(')
        .replaceAll(r'\frac{', '(')
        .replaceAll(r'\sqrt{', '√(')
        .replaceAll(r'\sqrt', '√')
        .replaceAll(r'\pi', 'π')
        .replaceAll(r'\alpha', 'α')
        .replaceAll(r'\beta', 'β')
        .replaceAll(r'\gamma', 'γ')
        .replaceAll(r'\delta', 'δ')
        .replaceAll(r'\theta', 'θ')
        .replaceAll(r'\lambda', 'λ')
        .replaceAll(r'\mu', 'μ')
        .replaceAll(r'\sigma', 'σ')
        .replaceAll(r'\omega', 'ω')
        .replaceAll(r'\Omega', 'Ω')
        .replaceAll(r'\rho', 'ρ')
        .replaceAll(r'\epsilon', 'ε')
        .replaceAll(r'\Delta', 'Δ')
        .replaceAll(r'\Sigma', 'Σ')
        .replaceAll(r'\infty', '∞')
        .replaceAll(r'\pm', '±')
        .replaceAll(r'\times', '×')
        .replaceAll(r'\cdot', '·')
        .replaceAll(r'\neq', '≠')
        .replaceAll(r'\leq', '≤')
        .replaceAll(r'\geq', '≥')
        .replaceAll(r'\approx', '≈')
        .replaceAll(r'\sin', 'sin')
        .replaceAll(r'\cos', 'cos')
        .replaceAll(r'\tan', 'tan')
        .replaceAll(r'\log', 'log')
        .replaceAll(r'\ln', 'ln')
        .replaceAll(r'\lim', 'lim')
        .replaceAll(r'\sum', 'Σ')
        .replaceAll(r'\int', '∫')
        .replaceAll(r'\quad', ' ')
        .replaceAll(r'\,', ' ')
        .replaceAll(r'\!', '')
        .replaceAll(r'\left', '')
        .replaceAll(r'\right', '')
        .replaceAll(r'\text{', '')
        .replaceAll(r'\mathrm{', '')
        .replaceAll(r'\vec{', '')
        .replaceAll(r'\hat{', '')
        .replaceAll(r'}{', ' / ')
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll(r'\', '')
        .replaceAll(r'^2', '²')
        .replaceAll(r'^3', '³')
        .replaceAll(r'^4', '⁴')
        .replaceAll(r'^n', 'ⁿ')
        .replaceAll(r'^{-1}', '⁻¹')
        .replaceAll(r'^{-2}', '⁻²')
        .replaceAll(r'_1', '₁')
        .replaceAll(r'_2', '₂')
        .replaceAll(r'_n', 'ₙ')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.onSurface;
    final readable = _toReadable(latex);

    return SelectableText(
      readable,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'monospace',
        fontSize: fontSize,
        color: effectiveColor,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
    );
  }
}
