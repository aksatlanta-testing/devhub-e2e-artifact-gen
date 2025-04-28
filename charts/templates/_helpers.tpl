
{{- define "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.labels" -}}
helm.sh/chart: {{ include "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.chart" . }}
{{ include "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdfc4f8d-8fe9-4f8f-a1ed-43e19af37853.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}