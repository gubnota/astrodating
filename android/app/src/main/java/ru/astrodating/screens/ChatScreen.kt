package ru.astrodating.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.compose.ui.Alignment
import androidx.compose.ui.tooling.preview.Preview
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun ChatScreen(navController: NavController?, personName: String?) {
    var message by remember { mutableStateOf(TextFieldValue("")) }
    val messages = remember { mutableStateListOf<String>() }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Chat with $personName",
            style = MaterialTheme.typography.headlineMedium,
            modifier = Modifier.align(Alignment.CenterHorizontally)
        )

        Spacer(modifier = Modifier.height(16.dp))

        Column(
            modifier = Modifier.weight(1f)
        ) {
            messages.forEach { msg ->
                Text(text = msg, modifier = Modifier.padding(4.dp))
            }
        }

        OutlinedTextField(
            value = message,
            onValueChange = { message = it },
            label = { Text("Enter message...") },
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                if (message.text.isNotEmpty()) {
                    messages.add(message.text)
                    message = TextFieldValue("")
                }
            },
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 8.dp)
        ) {
            Text("Send")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun ChatScreenPreview() {
    AstrodatingTheme {
        ChatScreen(navController = null, personName = "John Doe")
    }
}
