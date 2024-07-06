package ru.astrodating.screens.part

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun Part3View(navController: NavHostController?) {
    var astrologicalSign by remember { mutableStateOf("Aries") }
    var chineseZodiac by remember { mutableStateOf("Rat") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        OutlinedTextField(
            value = astrologicalSign,
            onValueChange = { astrologicalSign = it },
            label = { Text("Astrological Sign") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = chineseZodiac,
            onValueChange = { chineseZodiac = it },
            label = { Text("Chinese Zodiac") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                navController?.navigate("part4")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}
@Preview(showBackground = true)
@Composable
fun Part3ScreenPreview() {
    AstrodatingTheme {
        Part3View(navController = null)
    }
}