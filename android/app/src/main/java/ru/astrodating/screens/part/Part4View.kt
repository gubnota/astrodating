package ru.astrodating.screens.part

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun Part4View(navController: NavHostController?) {
    var selectedLoveLanguage by remember { mutableStateOf("Approval") }
    val loveLanguages = listOf("Approval", "Time", "Help", "Presents")

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("Select your main love language")

        loveLanguages.forEach { language ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 4.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                RadioButton(
                    selected = selectedLoveLanguage == language,
                    onClick = { selectedLoveLanguage = language }
                )
                Text(language, modifier = Modifier.padding(start = 8.dp))
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = {
                navController?.navigate("part5")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}
@Preview(showBackground = true)
@Composable
fun Part4ScreenPreview() {
    AstrodatingTheme {
        Part4View(navController = null)
    }
}