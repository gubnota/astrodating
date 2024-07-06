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
fun Part7View(navController: NavHostController?) {
    var tel by remember { mutableStateOf("") }
    var vkLink by remember { mutableStateOf("") }
    var okLink by remember { mutableStateOf("") }
    var fbLink by remember { mutableStateOf("") }
    var igLink by remember { mutableStateOf("") }
    var telegramLink by remember { mutableStateOf("") }
    var skype by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        OutlinedTextField(
            value = tel,
            onValueChange = { tel = it },
            label = { Text("Telephone") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = vkLink,
            onValueChange = { vkLink = it },
            label = { Text("VK Link") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = okLink,
            onValueChange = { okLink = it },
            label = { Text("OK Link") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = fbLink,
            onValueChange = { fbLink = it },
            label = { Text("Facebook Link") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = igLink,
            onValueChange = { igLink = it },
            label = { Text("Instagram Link") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = telegramLink,
            onValueChange = { telegramLink = it },
            label = { Text("Telegram Link") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 8.dp)
        )

        OutlinedTextField(
            value = skype,
            onValueChange = { skype = it },
            label = { Text("Skype") },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                navController?.navigate("part8")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Part7ScreenPreview() {
    AstrodatingTheme {
        Part7View(navController = null)
    }
}
