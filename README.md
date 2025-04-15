This repository provides a LaTeX résumé template inspired by the [Harvard Bullet Point Résumé Template](https://careerservices.fas.harvard.edu/resources/bullet-point-resume-template/). It is **not** an official Harvard template, but rather a customized version meant to capture a similar look and feel.

## Overview

<table border="1" cellspacing="0" cellpadding="10" style="width: 100%; text-align: center;">
  <tr>
    <td style="width: 50%;">
      <img src="https://raw.githubusercontent.com/WilliamOdinson/cv-for-industry/main/assets/Harvard.png" alt="Preview of the template" style="max-width: 100%;">
    </td>
    <td style="width: 50%;">
      <img src="https://raw.githubusercontent.com/WilliamOdinson/cv-for-industry/main/assets/Default.png" alt="Default preview" style="max-width: 100%;">
    </td>
  </tr>
  <tr>
    <td style="text-align: center;"><strong>Harvard</strong></td>
    <td style="text-align: center;">Default</td>
  </tr>
</table>

- **main.tex**  
  The primary file where sections such as *Education*, *Experience*, *Leadership & Activities*, and *Notable Github Projects* are orchestrated.
  
- **personal.tex**  
  This file holds most of the user-specific details (name, contact info, summary, and definitions for each education/work experience). **You will edit this file the most** to tailor the résumé to your information.

- **resume.cls**  
  A custom LaTeX class that styles the résumé. It handles margins, fonts, spacing, and other layout configurations.

## How to Use

1. **Clone or Download** the repository.
2. Open the project in [Overleaf](https://www.overleaf.com/) or another LaTeX environment of your choice.
3. Update the following files to customize your résumé:
   - **personal.tex**: Change `\firstname`, `\lastname`, `\email`, `\linkedin`, and `\github` to your details. Update the `\Education`, `\Experience`, and `\Project` blocks with your own information.
   - **main.tex**: Organize, add, or remove résumé sections as needed.
4. Compile `main.tex` to generate your PDF résumé.
