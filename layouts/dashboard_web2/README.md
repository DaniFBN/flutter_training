# Anotações

- Wrap -> Coloca no eixo que voce quiser, quando não couber, ele "quebra linha"
- Row -> Lado a lado eternamente
- Column -> Em cima eternamente

---

- SizedBox - width/height
- Padding - padding
- Container - width/height/padding/margin

---

### Widget com children

- Column
- Row
- Wrap
- ListView
- Stack

---

### Page

- Row
  - Drawer
  - Column
    - AppBar
    - Body

---

### AppBar

- Stack
  - AppBar
    - Row
      - MenuSection
        - Row
          - Text - Home
          - Divider
          - Text - Relatórios
          - Divider
          - Text - Portal
      - Spacer - flex 3
      - IconButton - notificação
      - Spacer - flex 1
      - UserSection
        - Row
          - Image
          - Text - userName
          - IconButton - Sair
  - ExpandedButton

---

### Drawer

- Column
  - Image
  - Divider
  - ListView
    - Row
      - Icon
      - Text

---

### Body

- Row
  - Container
    - Column
      - Text - Olá Daniel
      - Text - Bem vindo
      - Grid
  - Column
    - Container
    - Container
