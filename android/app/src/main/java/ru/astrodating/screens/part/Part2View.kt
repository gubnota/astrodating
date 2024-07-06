package ru.astrodating.screens.part

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme
import java.util.*

@Composable
fun Part2View(navController: NavHostController?) {
    var dateOfBirth by remember { mutableStateOf(Date()) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        OutlinedTextField(
            value = dateOfBirth.toString(),
            onValueChange = { /* Handle date change */ },
            label = { Text("Date of Birth") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                navController?.navigate("part3")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}
@Preview(showBackground = true)
@Composable
fun Part2ScreenPreview() {
    AstrodatingTheme {
        Part2View(navController = null)
    }
}
