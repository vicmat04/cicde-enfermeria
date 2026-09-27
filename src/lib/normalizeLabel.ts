/**
 * Normalize sidebar labels by removing structural numbering prefixes
 * 
 * Removes patterns like:
 * - "3. Title" → "Title"
 * - "3.2 Title" → "Title"
 * - "4) Title" → "Title"
 * - "1- Title" → "Title"
 * 
 * Protects legitimate terms:
 * - "Diabetes tipo 2" → "Diabetes tipo 2"
 * - "Ley 68 de 2003" → "Ley 68 de 2003"
 * - "Vitamina B12" → "Vitamina B12"
 * - "O2" → "O2"
 * - "5 correctos" → "5 correctos"
 */

/**
 * Remove structural numeric prefix from start of title
 * Display-only transformation - does NOT modify database
 */
export function normalizeNavigationLabel(title: string): string {
  // Pattern: optional whitespace + number(s) + optional dot/parenthesis/dash + space + rest
  // Only matches at START of string
  const structuralPrefix = /^\s*\d+(\.\d+)*[\.):\-–—]?\s+/;
  
  const normalized = title.replace(structuralPrefix, '');
  
  // Safety: if we removed everything, return original
  if (!normalized.trim()) {
    return title;
  }
  
  return normalized.trim();
}

/**
 * Test cases for normalization
 */
export function testNormalization() {
  const tests = [
    // Should strip
    ["3. Valoración del paciente", "Valoración del paciente"],
    ["3.2 Intervenciones", "Intervenciones"],
    ["4) Seguridad", "Seguridad"],
    ["1- Introducción", "Introducción"],
    ["10. Farmacología", "Farmacología"],
    ["2.1.3 Subsección", "Subsección"],
    
    // Should preserve
    ["Diabetes tipo 2", "Diabetes tipo 2"],
    ["Ley 68 de 2003", "Ley 68 de 2003"],
    ["Vitamina B12", "Vitamina B12"],
    ["O2", "O2"],
    ["CO2", "CO2"],
    ["5 correctos de medicamentos", "5 correctos de medicamentos"],
    
    // Edge cases
    ["", ""],
    ["   ", ""],
    ["123", "123"], // Pure number stays (safety fallback)
  ];
  
  tests.forEach(([input, expected]) => {
    const actual = normalizeNavigationLabel(input);
    if (actual !== expected) {
      console.warn(`❌ normalizeNavigationLabel("${input}") = "${actual}", expected "${expected}"`);
    }
  });
  
  return true;
}
